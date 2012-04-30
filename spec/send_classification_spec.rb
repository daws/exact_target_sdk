require 'spec_helper'
include ExactTargetSDK

describe SendClassification do
  context 'a bare SendClassification' do

    it { should_not be_valid }

  end

  context 'a validated SendClassification' do
    before(:each) do
      sp = ExactTargetSDK::SenderProfile.new 'ObjectID' => "some-object-id"
      dp = ExactTargetSDK::DeliveryProfile.new 'ObjectID' => "some-object-id"
      @send_classification = ExactTargetSDK::SendClassification.new('Name' => 'Test Classification', 'SenderProfile' => sp, 'DeliveryProfile' => dp )
      @send_classification.valid?
    end

    subject { @send_classification }

    it { should be_valid }

  end

end