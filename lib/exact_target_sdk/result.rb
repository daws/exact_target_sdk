require 'active_support/inflector'

module ExactTargetSDK
class Result

  # If @result contains :id key, while trying result.id it calls
  # Object#id alias method for Object#object_id instead calling method_missing
  undef id if self.respond_to? :id

  def initialize(hash)
    @result = hash
  end

  def method_missing(symbol, *args)
    @result[symbol.to_s.underscore.to_sym]
  end

end
end
