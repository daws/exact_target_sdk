# http://docs.code.exacttarget.com/020_Web_Service_Guide/Objects/Options
module ExactTargetSDK
class Options < Base

  # Represents the number of calls that must be received before the conversation support in the asynchronous API will begin processing.
  int_property "CallsInConversation"

  # Specifies the account ownership and context of an object.
  property "Client"

  # Unique ID of initial async API call; All requests that should be processed as a single unit will have the same ConversationID.
  property "ConversationID"

  # Defines the priority for a triggered send. Valid values include Low, Medium, and High.
  property "Priority"

  # Defines request as synchronous or asynchronous API.
  property "RequestType"

  # Keeps requests in asynchronous queue until time specified in the call.
  property "ScheduledTime"

  # Specifies the processing sequence of a multi-step conversation. This optional property requires the use of ConversationID.
  property "SequenceCode"

  # Allows upsert on selected objects.
  array_property "SaveOptions"

  # Defines how responses are returned and under what conditions. Optional.
  array_property "SendResponseTo"

end
end
