module ExactTargetSDK
class BounceEvent < APIObject

  # Date when a tracking event occurred.
  property "EventDate"

  # Contains identifier for a specific send.
  property "SendID"

  # Contains SMTP code related to a bounced email.
  property "SMTPCode"

  # Contains SMTP reason associated with a bounced email.
  property "SMTPReason"

  # Identification of a specific subscriber.
  property "SubscriberKey"

  # Identifies the triggered send definition associated with an event.
  # This value also appears in tracking events to allow you to tie those events to a specific triggered send.
  property "TriggeredSendDefinitionObjectID	"


end
end
