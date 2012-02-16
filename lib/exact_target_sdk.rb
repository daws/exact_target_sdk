require 'exact_target_sdk/config'
require 'exact_target_sdk/errors'

module ExactTargetSDK

  autoload :APIObject, 'exact_target_sdk/api_object'
  autoload :Attribute, 'exact_target_sdk/attribute'
  autoload :Client, 'exact_target_sdk/client'
  autoload :ComplexFilterPart, 'exact_target_sdk/complex_filter_part'
  autoload :CreateResponse, 'exact_target_sdk/create_response'
  autoload :CreateResult, 'exact_target_sdk/create_result'
  autoload :FilterPart, 'exact_target_sdk/filter_part'
  autoload :Result, 'exact_target_sdk/result'
  autoload :RetrieveResponse, 'exact_target_sdk/retrieve_response'
  autoload :RetrieveResult, 'exact_target_sdk/retrieve_result'
  autoload :SimpleFilterPart, 'exact_target_sdk/simple_filter_part'
  autoload :Subscriber, 'exact_target_sdk/subscriber'
  autoload :TriggeredSend, 'exact_target_sdk/triggered_send'
  autoload :TriggeredSendDefinition, 'exact_target_sdk/triggered_send_definition'
  autoload :UpdateResponse, 'exact_target_sdk/update_response'
  autoload :UpdateResult, 'exact_target_sdk/update_result'

end
