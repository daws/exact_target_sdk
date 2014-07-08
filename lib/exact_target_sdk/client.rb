require 'guid'
require 'savon'
require 'timeout'

module ExactTargetSDK

# Provides an object-oriented API to ExactTarget's Web Service API
# (http://docs.code.exacttarget.com/020_Web_Service_Guide)
#
# With few exceptions, ruby conventions for capitalization are ignored and those
# outlined in the guide linked above are used. This is done in an attempt to be
# as transparent as possible, so that the API may be used by referring only to
# the guide linked above.
class Client

  # Constructs a client.
  #
  # Any of the options documented in ExactTargetSDK#config may be overridden
  # using the options parameter.
  #
  # Since ExactTarget's API is stateless, constructing a client object will not
  # make any remote calls.
  def initialize(options = {})
    self.config = {
    }.merge!(ExactTargetSDK.config).merge!(options)

    initialize_client!
  end

  # Invokes the Create method.
  #
  # The provided arguments should each be sub-classes of APIObject, and each
  # provided object will be created in order.
  #
  # Possible exceptions are:
  #   HTTPError         if an HTTP error (such as a timeout) occurs
  #   SOAPFault         if a SOAP fault occurs
  #   Timeout           if there is a timeout waiting for the response
  #   InvalidAPIObject  if any of the provided objects don't pass validation
  #
  # Returns a CreateResponse object.
  def Create(*args)
    # TODO: implement and accept CreateOptions

    api_objects = args

    response = execute_request 'Create' do |xml|
      xml.CreateRequest do
        xml.Options  # TODO: support CreateOptions

        api_objects.each do |api_object|
          xml.Objects "xsi:type" => api_object.type_name do
            api_object.render!(xml)
          end
        end
      end
    end

    CreateResponse.new(response)
  end

  # Invokes the Retrieve method.
  #
  # Note that this implementation abstracts away the useless RetrieveRequest
  # sub-wrapper, and introduces a RequestResponse wrapper to contain the
  # output parameters.
  #
  # Does not currently support requests that have too many results for one
  # batch.
  #
  # Possible exceptions are:
  #   HTTPError         if an HTTP error (such as a timeout) occurs
  #   SOAPFault         if a SOAP fault occurs
  #   Timeout           if there is a timeout waiting for the response
  #   InvalidAPIObject  if any of the provided objects don't pass validation
  #
  # Returns a RetrieveResponse object.
  def Retrieve(object_type_name, filter, *properties)
    object_type_name = object_type_name.type_name if object_type_name.respond_to?(:type_name)
    response = execute_request 'Retrieve' do |xml|
      xml.RetrieveRequestMsg do
        xml.RetrieveRequest do
          xml.Options

          xml.ObjectType object_type_name

          properties.each do |property|
            xml.Properties(property)
          end

          xml.Filter "xsi:type" => filter.type_name do
            filter.render!(xml)
          end
        end
      end
    end

    RetrieveResponse.new(response)
  end

  # Invokes the Update method.
  #
  # The provided arguments should each be sub-classes of APIObject, and each
  # provided object will be updated in order.
  #
  # Possible exceptions are:
  #   HTTPError         if an HTTP error (such as a timeout) occurs
  #   SOAPFault         if a SOAP fault occurs
  #   Timeout           if there is a timeout waiting for the response
  #   InvalidAPIObject  if any of the provided objects don't pass validation
  #
  # Returns an UpdateResponse object.
  def Update(*args)
    # TODO: implement and accept UpdateOptions

    api_objects = args

    response = execute_request 'Update' do |xml|
      xml.UpdateRequest do
        xml.Options  # TODO: support UpdateOptions

        api_objects.each do |api_object|
          xml.Objects "xsi:type" => api_object.type_name do
            api_object.render!(xml)
          end
        end
      end
    end

    UpdateResponse.new(response)
  end

  # Invokes the Delete method.
  #
  # The provided arguments should each be sub-classes of APIObject, and each
  # provided object will be updated in order.
  #
  # Possible exceptions are:
  #   HTTPError         if an HTTP error (such as a timeout) occurs
  #   SOAPFault         if a SOAP fault occurs
  #   Timeout           if there is a timeout waiting for the response
  #   InvalidAPIObject  if any of the provided objects don't pass validation
  #
  # Returns a DeleteResponse object.
  def Delete(*args)
    # TODO: implement and accept DeleteOptions

    api_objects = args

    response = execute_request 'Delete' do |xml|
      xml.DeleteRequest do
        xml.Options  # TODO: support DeleteOptions

        api_objects.each do |api_object|
          xml.Objects "xsi:type" => api_object.type_name do
            api_object.render!(xml)
          end
        end
      end
    end

    DeleteResponse.new(response)
  end

  # Invokes the Perform method.
  #
  # The provided arguments should each be definitions that are sub-classes
  # of APIObject.
  #
  # Possible exceptions are:
  #   HTTPError         if an HTTP error (such as a timeout) occurs
  #   SOAPFault         if a SOAP fault occurs
  #   Timeout           if there is a timeout waiting for the response
  #   InvalidAPIObject  if any of the provided objects don't pass validation
  #
  # Returns a PerformResponse object.
  def Perform(action, *args)
    # TODO: implement and accept PerformOptions

    definitions = args

    response = execute_request 'Perform' do |xml|
      xml.PerformRequestMsg do
        xml.Action action

        xml.Definitions do
          definitions.each do |definition|
            xml.Definition "xsi:type" => definition.type_name do
              definition.render!(xml)
            end
          end
        end

        xml.Options  # TODO: support PerformOptions
      end
    end

    PerformResponse.new(response)
  end

  def logger
    config[:logger]
  end

  private

  attr_accessor :config, :client
  
  # Constructs and saves the savon client using provided config.
  def initialize_client!
    self.client = ::Savon.client(
      :endpoint => config[:endpoint],
      :namespace => config[:namespace],
      :open_timeout => config[:open_timeout],
      :read_timeout => config[:read_timeout],
      :raise_errors => false,
      :logger => config[:logger],
      :log => config[:logger] && config[:logger].level == Logger::DEBUG
    )
  end

  # Builds the SOAP request for the given method, delegating body
  # rendering to the provided block.
  #
  # Handles errors and re-raises with appropriate sub-class of
  # ExactTargetSDK::Error.
  #
  # Returns the raw savon response.
  def execute_request(method)
    begin
      response = client.call(method) do |locals|
        xml = Builder::XmlMarkup.new
        xml.instruct!(:xml, :encoding => 'UTF-8')
        result = begin
          xml.s :Envelope,
              "xmlns" => config[:namespace],
              "xmlns:xsd" => "http://www.w3.org/2001/XMLSchema",
              "xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance",
              "xmlns:s" => "http://www.w3.org/2003/05/soap-envelope",
              "xmlns:a" => "http://schemas.xmlsoap.org/ws/2004/08/addressing",
              "xmlns:o" => "http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd" do

            xml.s :Header do
              xml.a :Action, method, "s:mustUnderstand" => "1"
              xml.a :MessageID, "uuid:#{Guid.new.to_s}"
              xml.a :ReplyTo do
                xml.a :Address, "http://schemas.xmlsoap.org/ws/2004/08/addressing/role/anonymous"
              end
              xml.a :To, config[:endpoint], "s:mustUnderstand" => "1"
              xml.o :Security, "s:mustUnderstand" => "1" do
                xml.o :UsernameToken, "o:Id" => "test" do
                  xml.o :Username, config[:username]
                  xml.o :Password, config[:password]
                end
              end
            end

            xml.s :Body do
              yield(xml)
            end
          end
        end

        locals.xml result
      end


      if response.http_error?
        raise HTTPError, response.http_error.to_s
      end

      if response.soap_fault?
        raise SOAPFault, response.soap_fault.to_s
      end

      response
    rescue ::Timeout::Error => e
      timeout = ::ExactTargetSDK::TimeoutError.new("#{e.message}; open_timeout: #{config[:open_timeout]}; read_timeout: #{config[:read_timeout]}")
      timeout.set_backtrace(e.backtrace)
      raise timeout
    rescue Exception => e
      raise ::ExactTargetSDK::UnknownError, e
    end
  end

end

end
