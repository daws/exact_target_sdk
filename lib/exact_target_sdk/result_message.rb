# http://docs.code.exacttarget.com/020_Web_Service_Guide/Objects/ResultMessage
module ExactTargetSDK
class ResultMessage < APIObject

  # Number of calls within an async API conversation.
  property 'CallsInConversation'

  # Specifies the account ownership and context of an object.
  property 'Client'

  # Unique ID of initial async API call.
  property 'ConversationID'

  # Identifies correlation of objects across several requests.
  property 'CorrelationID'

  # Read-only date and time of the objects creation.
  property 'CreatedDate'

  # Identifies the error of an API request.
  property 'ErrorCode'

  # Last time object information was modified.
  property 'ModifiedDate'

  # Reserved for future use.
  property 'ObjectState'

  # Represents overall status of conversation via async API.
  property 'OverallStatusCode'

  # Describes account ownership of subscriber in an on-your-behalf account.
  property 'Owner'

  # Unique identifier provided by partner for an object, accessible only via API.
  property 'PartnerKey'

  # A collection of metadata supplied by client and stored by system - only accessible via API.
  array_property 'PartnerProperties'

  # Unique ID of initial async API call.
  property 'RequestID'

  # Defines request as synchronous or asynchronous API.
  property 'RequestType'

  # Contains details of operation result in XML format.
  property 'ResultDetailXML'

  # Defines result as coming from synchronous or asynchronous API.
  property 'ResultType'

  # Specifies the processing sequence of a multi-step conversation.
  property 'SequenceCode'

  # Status of async API request.
  property 'StatusCode'

  # Describes the status of an API call.
  property 'StatusMessage'

end
end
