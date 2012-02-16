require 'active_support/inflector'

module ExactTargetSDK
class Result

  def initialize(hash)
    @result = hash
  end

  def method_missing(symbol, *args)
    @result[symbol.to_s.underscore.to_sym]
  end

end
end
