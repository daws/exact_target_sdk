module ExactTargetSDK
class SenderProfile < APIObject

  property 'Name'

  # Specifies the default email message From Name. Deprecated for email send definitions and triggered send definitions.
  property 'FromName'

  # Indicates From address associated with a object. Deprecated for email send definitions and triggered send definitions.
  property 'FromAddress'

  # Indicates the To name to use on automatically forwarded email messages.
  property 'AutoForwardToName'

  # Indicates the email address to use with automatically forwarded email messages.
  property 'AutoForwardToEmailAddress'



end
end
