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

    Savon.configure do |c|
      c.logger = ExactTargetSDK.config[:logger]
      c.raise_errors = false
    end

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

    api_objects, options =  filter_options(args)

    response = execute_request 'Create' do |xml|
      xml.CreateRequest do

        api_objects.each do |api_object|
          xml.Objects "xsi:type" => api_object.type_name do
            api_object.render!(xml)
          end
        end

        options.each do |option|
          xml.Options do
            option.render!(xml)
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
  def Retrieve(object_type_name, filter, *args)
    object_type_name = object_type_name.type_name if object_type_name.respond_to?(:type_name)

    properties, options =  filter_options(args)

    response = execute_request 'Retrieve' do |xml|
      xml.RetrieveRequestMsg do
        xml.RetrieveRequest do

          xml.ObjectType object_type_name

          properties.each do |property|
            xml.Properties(property)
          end

          xml.Filter "xsi:type" => filter.type_name do
            filter.render!(xml)
          end

          options.each do |option|
            xml.Options do
              option.render!(xml)
            end
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

    api_objects, options =  filter_options(args)

    response = execute_request 'Update' do |xml|
      xml.UpdateRequest do

        api_objects.each do |api_object|
          xml.Objects "xsi:type" => api_object.type_name do
            api_object.render!(xml)
          end
        end

        options.each do |option|
          xml.Options do
            option.render!(xml)
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

    api_objects, options =  filter_options(args)

    response = execute_request 'Delete' do |xml|
      xml.DeleteRequest do
        api_objects.each do |api_object|
          xml.Objects "xsi:type" => api_object.type_name do
            api_object.render!(xml)
          end
        end

        options.each do |option|
          xml.Options do
            option.render!(xml)
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
    definitions, options = filter_options(args)

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

        options.each do |option|
          xml.Options do
            option.render!(xml)
          end
        end
      end
    end

    PerformResponse.new(response)
  end


  # Invokes the Schedule method.
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
    # Returns a ScheduleResponse object.
    def Schedule(action, schedule, *args)

      interactions, options = filter_options(args)

      response = execute_request 'Schedule' do |xml|
        xml.ScheduleRequestMsg do
          xml.Action action

          xml.Schedule do
            schedule.render!(xml)
          end

          xml.Interactions do
            interactions.each do |interaction|
              xml.Interaction "xsi:type" => interaction.type_name do
                interaction.render!(xml)
              end
            end
          end

          options.each do |option|
            xml.Options do
              option.render!(xml)
            end
          end

        end
      end

      ScheduleResponse.new(response)
    end


  def logger
    ExactTargetSDK.config[:logger]
  end

  private

  attr_accessor :config, :client

  # Constructs and saves the savon client using provided config.
  def initialize_client!
    self.client = ::Savon::Client.new do |wsdl, http|
      wsdl.endpoint = ExactTargetSDK.config[:endpoint]
      wsdl.namespace = ExactTargetSDK.config[:namespace]
      http.open_timeout = ExactTargetSDK.config[:open_timeout]
      http.read_timeout = ExactTargetSDK.config[:read_timeout]
    end
  end

  # Builds the SOAP request for the given method, delegating body
  # rendering to the provided block.
  #
  # Handles errors and re-raises with appropriate sub-class of
  # ExactTargetSDK::Error.
  #
  # Returns the raw savon response.
  def execute_request(method)
      response = client.request(method) do
        soap.xml do |xml|
          xml.s :Envelope,
              "xmlns" => ExactTargetSDK.config[:namespace],
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
              xml.a :To, ExactTargetSDK.config[:endpoint], "s:mustUnderstand" => "1"
              xml.o :Security, "s:mustUnderstand" => "1" do
                xml.o :UsernameToken, "o:Id" => "test" do
                  xml.o :Username, ExactTargetSDK.config[:username]
                  xml.o :Password, ExactTargetSDK.config[:password]
                end
              end
            end

            xml.s :Body do
              yield(xml)
            end
          end
        end
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
  end

  def filter_options(args)
    options = find_options(args)
    options.each{|opt| args.delete(opt)}
    [args,options]
  end


  def find_options(args)
    options = []
    args.each { |arg| options << arg if arg.is_a? Options }
    options
  end

end

end
