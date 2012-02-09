require 'spec_helper'

include ExactTargetSDK

describe Client do

  context 'a default Client' do

    subject { Client.new }

    it 'should have a default logger' do
      subject.logger.should be
    end

  end

  context 'a default Client in a rails environment' do

    before(:each) do
      ExactTargetSDK.instance_variable_set('@config', nil)
      RAILS_LOGGER = Logger.new(STDOUT)

      ::Rails = Class.new do
        def self.logger; RAILS_LOGGER; end
      end
    end

    subject { Client.new }
    
    it 'should use rails logger' do
      subject.logger.should == ::Rails.logger
    end

  end

end
