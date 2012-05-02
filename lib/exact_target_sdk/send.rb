module ExactTargetSDK
class Send < APIObject

  property 'Name'

  # Default email address for object. Indicates if subscriber information can be used for email sends.
  property "Email"

  # Specifies the name of an email message associated with a send.
  property "EmailName"

  # Indicates email send definition to which the send object is attached.
  property "EmailSendDefinition"

  # Indicates From address associated with a object.
  # Deprecated for email send definitions and triggered send definitions.
  property "FromAddress"

  # Specifies the default email message From Name.
  # Deprecated for email send definitions and triggered send definitions.
  property "FromName"

  # Indicates number of hard bounces associated with a send.
  property "HardBounces"

  # List associated with an object.
  property "List"

  # Number of sent emails that did not bounce.
  property "NumberDelivered"

  # Number of emails not sent as part of a send because an error occurred while trying to build the email.
  property "NumberErrored"

  # Indicates the number recipients excluded from an email send because of a held,
  # unsubscribed, master unsubscribed, or global unsubscribed status.
  property "NumberExcluded"

  # Number of emails actually sent as part of an email send.
  # This number reflects all of the sent messages and may include bounced messages.
  property "NumberSent"

  # Specifies number of Other-type bounces in a send.
  property "OtherBounces"

  # Indicates URL used to preview the message associated with a send.
  property "PreviewURL"

  # Indicates date on which a send took place.
  property "SentDate"

  # Indicates number of soft bounces associated with a specific send.
  property "SoftBounces"

  # Defines status of object.  Status of an address.
  property "Status"

  # Contains subject area information for a message.
  property "Subject"

  # Indicates number of unique clicks on message.
  property "UniqueClicks"

  # Indicates number of unique opens resulting from a triggered send.
  property "UniqueOpens"

  # Indicates the number of unsubscribe events associated with a send.
  property 'Unsubscribes'

end
end
