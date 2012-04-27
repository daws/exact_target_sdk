module ExactTargetSDK
class Email < APIObject

  property 'Name', :required => true
  property 'Subject', :required => true
  property 'HTMLBody'
  property 'TextBody'

end
end
