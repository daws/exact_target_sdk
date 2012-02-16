require 'active_model'

module ExactTargetSDK

# Parent class of all ExactTarget API objects (listed here:
# http://docs.code.exacttarget.com/020_Web_Service_Guide/Objects). Provides
# class-level declarations, validation, and rendering that makes modeling
# each object easy.
class APIObject

  include ::ActiveModel::Validations
  include ::ActiveModel::Validations::Callbacks

  class << self

    # Declares a property of this object, optionally requiring it upon
    # validation.
    #
    # Provides a getter and setter for this property, keeping track of
    # whether or not it has been set and registering it for rendering.
    def property(name, required = false)
      name = name.to_s
      attr_reader name.to_sym
      class_eval <<-__EOF__
        def #{name}=(value)
          @_set_#{name} = true
          @#{name} = value
        end
      __EOF__
      if required
        validates name.to_sym, :presence => true
      end
      register_property!(name)
    end

    # Declares a property as an array of values.
    #
    # Provides a getter and setter for this property. The getter will
    # always return an array (not null), so the client may simply append
    # to this property.
    #
    # Note that once the property has been either read or written to, it
    # will be rendered.
    def array_property(name)
      # TODO: type validation would be nice
      name = name.to_s
      class_eval <<-__EOF__
        def #{name}
          @_set_#{name} = true
          @#{name} ||= []
        end
        def #{name}=(value)
          @_set_#{name} = true
          @#{name} = value
        end
      __EOF__
      register_property!(name)
    end

    # Same as #property, adding validation the the provided value is an
    # integer.
    def int_property(name, required = false)
      property(name, required)
      validates name.to_sym, :numericality => { :allow_nil => true, :only_integer => true }
    end

    # Returns an array of all registered properties.
    def properties
      @properties || []
    end

    def type_name
      name.split('::').last
    end

    private

    # Stores the given property name to be used at render time.
    def register_property!(name)
      @properties ||= []
      @properties << name
      @properties.uniq!
    end

  end

  # By default, any properties may be passed and set.
  #
  # May be overridden.
  def initialize(properties = {})
    properties.each do |key, value|
      self.send "#{key}=", value
    end
  end

  # By default, returns the name of the class.
  #
  # May be overridden.
  def type_name
    self.class.type_name
  end

  # By default, runs validation and executes #render_properties!.
  #
  # If overridden, the child class should check wehter or not the
  # object is valid, and then render the object. In general,
  # the render_properties! method should be overridden instead.
  def render!(xml)
    raise(InvalidAPIObject, self) if invalid?
    render_properties!(xml)
  end

  # By default, loops through all registered properties, and renders
  # each that has been explicitly set.
  #
  # May be overridden.
  def render_properties!(xml)
    self.class.properties.each do |property|
      next unless instance_variable_get("@_set_#{property}")
      property_value = self.send(property)
      render_property!(property, property_value, xml)
    end
  end

  def render_property!(property_name, property_value, xml)
    if property_value.is_a?(APIObject)
      xml.__send__(property_name, { "xsi:type" => property_value.type_name } ) do
        property_value.render!(xml)
      end
    elsif property_value.is_a?(Array)
      property_value.each do |current|
        render_property!(property_name, current, xml)
      end
    else
      xml.__send__(property_name, property_value.to_s)
    end
  end

end
end
