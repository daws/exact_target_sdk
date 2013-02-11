# http://docs.code.exacttarget.com/020_Web_Service_Guide/Objects/AsyncResponse
module ExactTargetSDK
class AsyncResponse < Base

  # Indicates whether the APIObject should be included in the response.
  property 'IncludeObjects'

  # Determines whether the Result objects will be included in the response when an asynchronous API call completes processing.
  property 'IncludeResults'

  # Reduce object to base APIObject information. Includes basic reference data associating object and request.
  property 'OnlyIncludeBase'

  # Specifies event triggers the AsyncResponse object action.
  property 'RespondWhen'

  # Email address or public URL to receive POST response to asynchronous request.
  property 'ResponseAddress'

  # Specifies type of response associated with an asynchronous operation.
  property 'ResponseType'

end
end
