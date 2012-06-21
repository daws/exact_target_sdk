module ExactTargetSDK
class ContentValidation < APIObject

  # Default email address for object. Indicates if subscriber information can be used for email sends.
  property 'Email'

  # Specifies the validation action to run on content. Valid values include SpamAssassinValidation.
  property 'ValidationAction'

  # Indicates subscribers associated with an object.
  array_property 'Subscribers', :nest_children => true

end
end
