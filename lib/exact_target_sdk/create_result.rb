require 'active_support/inflector'

module ExactTargetSDK
class CreateResult

  PROPERTIES = [
    'StatusCode',
    'StatusMessage',
    'ErrorCode'
  ]

  PROPERTIES.each do |property|
    attr_reader property
  end

  def initialize(hash)
    PROPERTIES.each do |property|
      instance_variable_set("@#{property}", hash[property.underscore.to_sym])
    end
  end

end
end
