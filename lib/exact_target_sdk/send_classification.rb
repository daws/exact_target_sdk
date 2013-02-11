module ExactTargetSDK
class SendClassification < APIObject

  property 'Name', :required => true

  property 'SenderProfile', :required => true

  property 'DeliveryProfile', :required => true

end
end
