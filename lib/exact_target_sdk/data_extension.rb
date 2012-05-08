module ExactTargetSDK
class DataExtension < APIObject

  property 'CustomerKey'
  array_property 'Fields', :nest_children => true
  property 'Name'

  # Indicates whether you can use a data extension as part of an audience for a message send.
  property 'IsSendable'

  # Indicates whether a sendable data extension can be used within tests sends for a message.
  property 'IsTestable'

end
end
