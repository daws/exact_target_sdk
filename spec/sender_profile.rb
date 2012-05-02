require 'spec_helper'
include ExactTargetSDK

describe SenderProfile do
  context 'a bare SenderProfile' do

    it { should_not be_valid }

  end

  context ' a validated SenderProfile ' do
    before(:each) do
      @sender_profile = SenderProfile.new 'Name' => 'Test Profile',
                                          'FromName' => 'Bob',
                                          'FromAddress' => 'bob@example.com'
      @sender_profile.valid?
    end

    subject { @sender_profile }

    it { should be_valid }

  end

end