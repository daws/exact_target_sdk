module ExactTargetSDK
class EmailSendDefinition < APIObject

  property 'Name', :required => true

  # Indicates the send classification to use as part of a send definition.
  property 'SendClassification'

   # Indicates the subscriber list to use as part of an email send definition.
  array_property 'SendDefinitionList'

  # Default email address for object. Indicates if subscriber information can be used for email sends.
  property 'Email'

  # Defines an email address to which to send a test message as part
  # of an email send definition. Use the Test action when sending a
  # test email to an email send definition.
  property 'TestEmailAddr'

  # Defines account users with access to tracking information for that send definition.
  property 'TrackingUsers'

  # Defines blind carbon copy email address to which to send a message as
  # part of an email send definition.
  property 'AutoBccEmail'

  # Indicates email addresses to receive blind carbon copy of a message.
  property 'BccEmail'

  # CC
  property 'CCEmail'

  # Defines scheduled data and time for a send related to an email send definition.
  property 'DeliveryScheduledTime'

  # Subject for an email send
  property 'EmailSubject'

  # Defines an email address to which to send a test message as part of an email send definition.
  # Use the Test action when sending a test email to an email send definition.
  property "TestEmailAddr"

  #Identifies the sender profile included in the send classificiation.
  property 'SenderProfile'


end
end



