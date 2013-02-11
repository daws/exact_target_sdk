module ExactTargetSDK
class DataExtension < APIObject

  property 'CustomerKey'
  array_property 'Fields', :nest_children => true
  property 'Name'

  # Indicates whether you can use a data extension as part of an audience for a message send.
  property 'IsSendable'

  # Indicates whether a sendable data extension can be used within tests sends for a message.
  property 'IsTestable'

  # Indicates the field within a sendable data extension to use as an address as part of a send.
  # Possible values include SubscriberID, CustomerKey, or EmailAddress.
  # The application uses this field to establish a data relationship between a value specified by the
  # SendableSubscriberField property and a value within a sendable data extension.
  property 'SendableDataExtensionField'

  # Indicates field to use as sending address. The application uses this field to establish a data relationship
  # between a subscriber field and a value specified by the SendableDataExtentionField property.
  property 'SendableSubscriberField'

end
end
