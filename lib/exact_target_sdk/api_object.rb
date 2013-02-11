module ExactTargetSDK

# Parent class of all ExactTarget API objects (listed here:
# http://docs.code.exacttarget.com/020_Web_Service_Guide/Objects). Provides
# class-level declarations, validation, and rendering that makes modeling
# each object easy.
  class APIObject < Base

    property 'ID'
    property 'ObjectID'
    property 'CustomerKey'

  end
end
