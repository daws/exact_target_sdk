module ExactTargetSDK
class PerformResponse

  attr_reader :OverallStatus, :OverallStatusMessage, :RequestID, :Results

  def initialize(response)
    response = response.to_hash[:perform_response_msg]
    @OverallStatus = response[:overall_status]
    @OverallStatusMessage = response[:overall_status_message]
    @RequestID = response[:request_id]
    @Results = []

    results = if response[:results].is_a? Array
                response[:results]
              elsif response[:results].is_a? Hash
                [response[:results]]
              else
                []
              end
    results.each do |result|
      @Results << PerformResult.new(result)
    end
  end

end
end
