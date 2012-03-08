module ExactTargetSDK
class TriggeredSend < APIObject

  array_property 'Attributes'
  array_property 'Subscribers'
  property 'TriggeredSendDefinition', :required => true

end
end
