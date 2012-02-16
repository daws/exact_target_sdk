require 'exact_target_sdk/config'
require 'exact_target_sdk/errors'

module ExactTargetSDK

  autoload :APIObject, 'exact_target_sdk/api_object'
  autoload :Attribute, 'exact_target_sdk/attribute'
  autoload :Client, 'exact_target_sdk/client'
  autoload :CreateResponse, 'exact_target_sdk/create_response'
  autoload :CreateResult, 'exact_target_sdk/create_result'
  autoload :Subscriber, 'exact_target_sdk/subscriber'
  autoload :TriggeredSend, 'exact_target_sdk/triggered_send'
  autoload :TriggeredSendDefinition, 'exact_target_sdk/triggered_send_definition'
  autoload :UpdateResponse, 'exact_target_sdk/update_response'
  autoload :UpdateResult, 'exact_target_sdk/update_result'

end
