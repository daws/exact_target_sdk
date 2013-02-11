# http://docs.code.exacttarget.com/020_Web_Service_Guide/Objects/SaveAction
module ExactTargetSDK
module SaveAction
  # Indicates that data should only be added and not updated during a save action.
  ADD_ONLY = "AddOnly"

  #Specifies default source of salutation when building an email (SalutationSourceEnum) Use the default action when saving an object. (SaveAction)
  DEFAULT = "Default"

  #Indicates whether an object should be deleted.
  DELETE = "Delete"

  #Indicates no save action should take place.
  NOTHING = "Nothing"

  #Indicates an UpdateAdd type for a save action. If this property is specified, the save action will update existing information and add new information.
  UPDATE_ADD = "UpdateAdd"

  #Indicates an UpdateOnly type for a save action. If this property is specified, the save action with update existing information only.
  UPDATE_ONLY = "UpdateOnly"
  
end
end
