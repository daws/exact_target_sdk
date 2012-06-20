# http://docs.code.exacttarget.com/020_Web_Service_Guide/Objects/RespondWhen
module ExactTargetSDK
module RespondWhen
  # Always send the response.
  ALWAYS = "Always"

  # Specifies that a response should never be set for an asynchronous process.
  NEVER = "Never"

  # Specifies that a response should be sent when an asynchronous call is complete.
  ON_CALL_COMPLETE = "OnCallComplete"

  # Specifies that a response should be sent when an asynchronous conversation is complete.
  ON_CONVERSATION_COMPLETE = "OnConversationComplete"

  # Specifies that a response should be sent when an asynchronous conversation returns an error.
  ON_CONVERSATION_ERROR = "OnConversationError"

  # Specifies that a response should be send when an asynchronous process returns an error.
  ON_ERROR = "OnError"
end
end

