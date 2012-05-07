module ExactTargetSDK
class SendDefinitionList < APIObject

  property 'DataSourceTypeID'
  property 'List'

  property 'Name'

  # Indicates the specified send is a test send. A value of true indicates a test send.
  property 'IsTestObject'

  # Represents the ID of the sendable data extension used as part of a send.
  property 'CustomObjectID'

end
end
