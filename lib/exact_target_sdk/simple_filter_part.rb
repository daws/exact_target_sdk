module ExactTargetSDK
class SimpleFilterPart < FilterPart

  property 'Property', :required => true
  property 'SimpleOperator', :required => true
  array_property 'Value'

end
end
