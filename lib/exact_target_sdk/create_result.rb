module ExactTargetSDK
class CreateResult

  attr_reader :StatusCode, :StatusMessage

  def initialize(hash)
    @StatusCode = hash[:status_code]
    @StatusMessage = hash[:status_message]
  end

end
end
