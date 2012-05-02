module ExactTargetSDK
class List < APIObject

  property 'ListName', :required => true
  array_property 'Subscribers'

end
end
