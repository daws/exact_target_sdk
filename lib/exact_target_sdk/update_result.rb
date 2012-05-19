module ExactTargetSDK
  class UpdateResult < Result
    def object
      @result[:object]
    end

    def id
      object && object[:id]
    end
  end
end
