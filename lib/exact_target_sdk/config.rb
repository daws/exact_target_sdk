require 'logger'

module ExactTargetSDK

  DEFAULT_TIMEOUT = 15
  DEFAULT_ENDPOINT = 'https://webservice.s4.exacttarget.com/Service.asmx'
  DEFAULT_NAMESPACE = 'http://exacttarget.com/wsdl/partnerAPI'

  # Globally configures and retrieves configuration for the ExactTarget SDK.
  #
  # == Environment Variables
  #
  # For convenience in a command-line environment, configuration may be skipped
  # by setting the EXACT_TARGET_SDK_USERNAME and EXACT_TARGET_SDK_PASSWORD
  # environment variables, which are self-explanatory.
  #
  # == Rails
  #
  # If running in a rails environment, this configuration will automatically use
  # the global Rails.logger instance. This behavior may be overridden by passing
  # in a :logger option.
  #
  # @param [Hash] options
  # @option options [String] :username (nil) ExactTarget account username
  # @option options [String] :password (nil) ExactTarget account password
  # @option options [Logger] :logger (Rails.logger) Logger to use
  # @option options [Numeric] :open_timeout (ExactTargetSDK::DEFAULT_TIMEOUT)
  #   Number of seconds to wait for the connection to open
  #   (see Net::HTTP#open_timeout)
  # @option options [Numeric] :read_timeout (ExactTargetSDK::DEFAULT_TIMEOUT)
  #   Number of seconds to wait for one block to be read
  #   (see Net::HTTP#read_timeout)
  def self.config(options = nil)
    @config ||= {
      :username => ENV['EXACT_TARGET_SDK_USERNAME'],
      :password => ENV['EXACT_TARGET_SDK_PASSWORD'],
      :logger => default_logger,
      :open_timeout => DEFAULT_TIMEOUT,
      :read_timeout => DEFAULT_TIMEOUT,
      :endpoint => DEFAULT_ENDPOINT,
      :namespace => DEFAULT_NAMESPACE,
    }
    
    @config.merge!(options) if options

    @config
  end

  private

  def self.default_logger
    if defined?(::Rails)
      ::Rails.logger
    else
      logger = ::Logger.new(STDERR)
      logger.level = ::Logger::INFO
      logger
    end
  end

end
