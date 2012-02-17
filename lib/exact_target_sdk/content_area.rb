module ExactTargetSDK

# Documentation here:
# http://docs.code.exacttarget.com/020_Web_Service_Guide/Objects/ContentArea
class ContentArea < APIObject

  int_property 'CategoryID'
  property 'Content'
  property 'Layout'
  property 'Name'

  validates 'Layout',
    :inclusion => { :allow_nil => true, :in => %w( HTMLWrapped RawText SMS ) }

end

end
