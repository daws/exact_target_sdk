require 'spec_helper'

include ExactTargetSDK

describe Subscriber do

  context 'a bare Subscriber' do

    it { should_not be_valid }

  end

  context 'a validated Subscriber with only SubscriberKey set' do

    before(:each) do
      @subscriber = Subscriber.new 'SubscriberKey' => 'dave@example.com'
      @subscriber.valid?
    end

    subject { @subscriber }

    it { should be_valid }

    it 'should have SubscriberKey set' do
      subject.SubscriberKey.should == 'dave@example.com'
    end

    it 'should have EmailAddress set to SubscriberKey' do
      subject.EmailAddress.should == subject.SubscriberKey
    end

  end

  context 'a validated Subscriber with only EmailAddress set' do

    before(:each) do
      @subscriber = Subscriber.new 'EmailAddress' => 'dave@example.com'
      @subscriber.valid?
    end

    subject { @subscriber }

    it { should be_valid }

    it 'should have EmailAddress set' do
      subject.EmailAddress.should == 'dave@example.com'
    end

    it 'should have SubscriberKey set to EmailAddress' do
      subject.SubscriberKey.should == subject.EmailAddress
    end

  end

  context 'a validated Subscriber with SubscriberKey and EmailAddress set' do

    before(:each) do
      @subscriber = Subscriber.new 'SubscriberKey' => 12345, 'EmailAddress' => 'dave@example.com'
      @subscriber.valid?
    end

    subject { @subscriber }

    it 'should have proper SubscriberKey' do
      subject.SubscriberKey.should == 12345
    end

    it 'should have proper EmailAddress' do
      subject.EmailAddress.should == 'dave@example.com'
    end

  end

end
