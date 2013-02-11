module ExactTargetSDK
class DeliveryProfile < APIObject

  property 'Name', :required => true

  property 'SourceAddressType'

  # Defines source of a footer salutation to use as part of a delivery profile or send definition (Default, Content Library, or None)
  property 'FooterSalutationSource'

  # Defines source of header salutation for a delivery profile or send definition.
  property 'HeaderSalutationSource'

end
end
