# http://docs.code.exacttarget.com/020_Web_Service_Guide/Objects/Email
module ExactTargetSDK
class Email < APIObject

  # Name of the object or property.
  property 'Name', :required => true

  # Contains subject area information for a message.
  property 'Subject', :required => true

  # Contains HTML body of an email message.
  property 'HTMLBody'

  # Contains raw text body of a message.
  property 'TextBody'

  # Indicates if email message was created via pasted HTML.
  property 'IsHTMLPaste'

end
end
