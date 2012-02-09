require 'spec_helper'

include ExactTargetSDK

describe 'ExactTargetSDK.config' do

  context 'a fresh default config' do

    before(:each) do
      ExactTargetSDK.instance_variable_set('@config', nil)
    end

    subject { ExactTargetSDK.config }

    it 'should have nil username' do
      subject[:username].should_not be
    end

    it 'should have nil password' do
      subject[:password].should_not be
    end

    it 'should have a logger' do
      subject[:logger].should be_a Logger
    end

  end

  context 'a config created in an environment with username and password environment variables' do

    before(:each) do
      ENV['EXACT_TARGET_SDK_USERNAME'] = 'cookie_monster'
      ENV['EXACT_TARGET_SDK_PASSWORD'] = 'chocoCH1P'
      ExactTargetSDK.instance_variable_set('@config', nil)
    end

    after(:each) do
      ENV['EXACT_TARGET_SDK_USERNAME'] = nil
      ENV['EXACT_TARGET_SDK_PASSWORD'] = nil
    end

    subject { ExactTargetSDK.config }

    it 'should use environment username' do
      subject[:username].should == 'cookie_monster'
    end

    it 'should use environment password' do
      subject[:password].should == 'chocoCH1P'
    end

  end

  context 'a clean, unaccessed config' do

    before(:each) do
      ExactTargetSDK.instance_variable_set('@config', nil)
    end

    subject { ExactTargetSDK }

    it 'should store an explicitly-set username' do
      subject.config :username => 'oscar_the_grouch'
      subject.config[:username].should == 'oscar_the_grouch'
    end

    it 'should store an explicitly-set logger' do
      my_logger = Logger.new(STDOUT)
      subject.config :logger => my_logger
      subject.config[:logger].should == my_logger
    end

  end

end
