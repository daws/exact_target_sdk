# http://docs.code.exacttarget.com/020_Web_Service_Guide/Objects/RetrieveOptions
module ExactTargetSDK
class RetrieveOptions < Options

  # Number of records to return in each batch as part of a Retrieve call.  Reserved for future use.
  property 'BatchSize'

  # Indicates whether the APIObject should be included in the response.
  property 'IncludeObjects'

  # Reduce object to base APIObject information. Includes basic reference data associating object and request.
  property 'OnlyIncludeBase'

end
end
