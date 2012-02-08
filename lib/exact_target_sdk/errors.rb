module ExactTargetSDK

# Parent of all errors raised by this SDK
class Error < ::StandardError
end

# Indicates an "HTTP error" as defined by savon
class HTTPError < Error
end

# Indicates a "SOAP fault" as defined by savon
class SOAPFault < Error
end

# Indicates the open or read timeouts were reached
class Timeout < Error
end

# Indicates validation failed on an APIObject, which is referenced
# in the exception.
class InvalidAPIObject < Error

  attr_reader :api_object

  def initialize(api_object)
    @api_object = api_object
  end

  def message
    "#{api_object.type_name} object is invalid: #{api_object.errors.full_messages.join('; ')}"
  end

end

end
