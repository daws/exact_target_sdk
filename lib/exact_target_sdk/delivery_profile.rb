module ExactTargetSDK
class DeliveryProfile < APIObject

  property 'Name', :required => true
  property 'SourceAddressType',:required => true

  validates 'SourceAddressType', :inclusion => { :allow_nil => false,
                                                   :in => %w( CustomPrivateIPAddress DefaultPrivateIPAddress ) }

end
end
