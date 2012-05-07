require 'active_support/inflector'

module ExactTargetSDK
  class Result

    def id
      @result[:id] || self.id
    end

    def object_id
      @result[:object_id] || self.object_id
    end

    def initialize(hash)
      @result = hash
    end

    def method_missing(symbol, *args)
      @result[symbol.to_s.underscore.to_sym]
    end

  end
end
