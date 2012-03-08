module ExactTargetSDK
class DataExtension < APIObject

  property 'CustomerKey'
  array_property 'Fields', :nest_children => true
  property 'Name'

end
end
