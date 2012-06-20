require 'exact_target_sdk/config'
require 'exact_target_sdk/errors'

module ExactTargetSDK

  autoload :APIObject, 'exact_target_sdk/api_object'
  autoload :AsyncResponse, 'exact_target_sdk/async_response'
  autoload :AsyncResponseType, 'exact_target_sdk/async_response_type'
  autoload :APIProperty, 'exact_target_sdk/api_property'
  autoload :Attribute, 'exact_target_sdk/attribute'
  autoload :Base, 'exact_target_sdk/base'
  autoload :BounceEvent, 'exact_target_sdk/bounce_event'
  autoload :Client, 'exact_target_sdk/client'
  autoload :ClickEvent, 'exact_target_sdk/click_event'
  autoload :ComplexFilterPart, 'exact_target_sdk/complex_filter_part'
  autoload :ContentArea, 'exact_target_sdk/content_area'
  autoload :ContentValidation, 'exact_target_sdk/content_validation'
  autoload :CreateResponse, 'exact_target_sdk/create_response'
  autoload :CreateResult, 'exact_target_sdk/create_result'
  autoload :DailyRecurrence, 'exact_target_sdk/daily_recurrence'
  autoload :DailyRecurrencePatternTypeEnum, 'exact_target_sdk/daily_recurrence_pattern_type_enum'
  autoload :DataExtension, 'exact_target_sdk/data_extension'
  autoload :DataExtensionField, 'exact_target_sdk/data_extension_field'
  autoload :DataExtensionFieldType, 'exact_target_sdk/data_extension_field_type'
  autoload :DataExtensionObject, 'exact_target_sdk/data_extension_object'
  autoload :DeleteResponse, 'exact_target_sdk/delete_response'
  autoload :DeleteResult, 'exact_target_sdk/delete_result'
  autoload :DeliveryProfile, 'exact_target_sdk/delivery_profile'
  autoload :DeliveryProfileSourceAddressTypeEnum, 'exact_target_sdk/delivery_profile_source_address_type_enum'
  autoload :Email, 'exact_target_sdk/email'
  autoload :EmailSendDefinition, 'exact_target_sdk/email_send_definition'
  autoload :FilterPart, 'exact_target_sdk/filter_part'
  autoload :PerformResponse, 'exact_target_sdk/perform_response'
  autoload :PerformResult, 'exact_target_sdk/perform_result'
  autoload :List, 'exact_target_sdk/list'
  autoload :LogicalOperators, 'exact_target_sdk/logical_operators'
  autoload :OpenEvent, 'exact_target_sdk/open_event'
  autoload :Options, 'exact_target_sdk/options'
  autoload :Priority, 'exact_target_sdk/priority'
  autoload :RecurrenceRangeTypeEnum, 'exact_target_sdk/recurrence_range_type_enum'
  autoload :RecurrenceTypeEnum, 'exact_target_sdk/recurrence_type_enum'
  autoload :Result, 'exact_target_sdk/result'
  autoload :RespondWhen, 'exact_target_sdk/respond_when'
  autoload :RetrieveResponse, 'exact_target_sdk/retrieve_response'
  autoload :RetrieveResult, 'exact_target_sdk/retrieve_result'
  autoload :RequestType, 'exact_target_sdk/request_type'
  autoload :SalutationSourceEnum, 'exact_target_sdk/salutation_source_enum'
  autoload :SaveAction, 'exact_target_sdk/save_action'
  autoload :SaveOption, 'exact_target_sdk/save_option'
  autoload :SimpleFilterPart, 'exact_target_sdk/simple_filter_part'
  autoload :Send, 'exact_target_sdk/send'
  autoload :ScheduleDefinition, 'exact_target_sdk/schedule_definition'
  autoload :ScheduleResponse, 'exact_target_sdk/schedule_response'
  autoload :ScheduleResult, 'exact_target_sdk/schedule_result'
  autoload :SendClassification, 'exact_target_sdk/send_classification'
  autoload :SendDefinitionList, 'exact_target_sdk/send_definition_list'
  autoload :SendDefinitionListTypeEnum, 'exact_target_sdk/send_definition_list_enum'
  autoload :SenderProfile, 'exact_target_sdk/sender_profile'
  autoload :SentEvent, 'exact_target_sdk/sent_event'
  autoload :SimpleOperator, 'exact_target_sdk/simple_operator'
  autoload :SpamAssassinValidation, 'exact_target_sdk/spam_assassin_validation'
  autoload :Subscriber, 'exact_target_sdk/subscriber'
  autoload :SubscriberList, 'exact_target_sdk/subscriber_list'
  autoload :TriggeredSend, 'exact_target_sdk/triggered_send'
  autoload :TriggeredSendDefinition, 'exact_target_sdk/triggered_send_definition'
  autoload :ValidationAction, 'exact_target_sdk/validation_action'
  autoload :UpdateResponse, 'exact_target_sdk/update_response'
  autoload :UpdateResult, 'exact_target_sdk/update_result'

end
