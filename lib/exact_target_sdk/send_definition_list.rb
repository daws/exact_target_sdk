module ExactTargetSDK
class SendDefinitionList < APIObject

  property 'DataSourceTypeID', :required => true
  property 'List'

  validates 'DataSourceTypeID', :inclusion => { :allow_nil => false,
                                                   :in => %w( List CustomObject DomainExclusion SalesForceCampaign FilterDefinition OptOutList ) }

end

end
