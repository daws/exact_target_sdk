require 'active_model'
require 'active_support/inflector'

module ExactTargetSDK

  class Base
    # Properties that can be used as object id to perform update, delete,
    # perform and schedule actions
    ID_PROPERTIES = %w(ID ObjectID CustomerKey)

    include ::ActiveModel::Validations
    include ::ActiveModel::Validations::Callbacks

    class << self

      # Declares a property of this object, optionally requiring it upon
      # validation.
      #
      # Provides a getter and setter for this property, keeping track of
      # whether or not it has been set and registering it for rendering.
      def property(name, options = {})
        options = {
            :required => false
        }.merge(options)

        name = name.to_s
        attr_reader name.to_sym
        class_eval <<-__EOF__
           def #{name}=(value)
             @_set_#{name} = true
             @#{name} = value
           end
        __EOF__
        if options[:required]
          validates name.to_sym, :presence => true, :if => :new_record?
        end
        register_property!(name, options)
      end

      # Declares a property as an array of values.
      #
      # Provides a getter and setter for this property. The getter will
      # always return an array (not null), so the client may simply append
      # to this property.
      #
      # Note that once the property has been either read or written to, it
      # will be rendered.
      def array_property(name, options = {})
        # TODO: type validation would be nice
        name = name.to_s

        options = {
            :nest_children => false,
            :singular => name.singularize
        }.merge(options)

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
        register_property!(name, options)
      end

      # Same as #property, adding validation the the provided value is an
      # integer.
      def int_property(name, options = {})
        options = {
            :required => false
        }.merge(options)
        property(name, options)
        validates name.to_sym, :numericality => {:allow_nil => true, :only_integer => true}, :if => :new_record?
      end

      # Returns an array of all registered properties of current class.
      def properties
        @properties || {}
      end

      # Returns an array of all registered properties, including parent classes
      def all_properties
        properties = {}
        self.ancestors.each do |klass|
          properties.merge!(klass.properties) if klass.respond_to? :properties
        end
        properties
      end

      def type_name
        name.split('::').last
      end

      private

      # Stores the given property name to be used at render time.
      def register_property!(name, options = {})
        @properties ||= {}
        @properties[name] = options
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
      self.class.all_properties.each do |property, options|
        next unless instance_variable_get("@_set_#{property}")
        property_value = self.send(property)
        render_property!(property, property_value, xml, options)
      end
    end

    def render_property_array!(property_name, array, xml)
      array.each do |current|
        render_property!(property_name, current, xml)
      end
    end

    def render_property!(property_name, property_value, xml, options = {})
      if property_value.is_a?(APIObject)
        xml.__send__(property_name, {"xsi:type" => property_value.type_name}) do
          property_value.render!(xml)
        end
      elsif property_value.is_a?(Array)
        if options[:nest_children]
          xml.__send__(property_name) do
            render_property_array!(options[:singular], property_value, xml)
          end
        else
          render_property_array!(property_name, property_value, xml)
        end
      else
        xml.__send__(property_name, property_value.to_s)
      end
    end

    def new_record?
      ID_PROPERTIES.each {|property| return false if instance_variable_get("@_set_#{property}")}
      true
    end

  end

end