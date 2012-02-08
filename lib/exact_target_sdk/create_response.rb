module ExactTargetSDK
class CreateResponse

  attr_reader :OverallStatus, :RequestID, :Results

  def initialize(response)
    response = response.to_hash[:create_response]
    @OverallStatus = response[:overall_status]
    @RequestID = response[:request_id]
    @Results = []
    (response[:results] || []).each do |result|
      @Results << CreateResult.new(result)
    end
  end

end
end
