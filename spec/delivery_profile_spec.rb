require 'spec_helper'
include ExactTargetSDK

describe DeliveryProfile do
  context 'a bare DeliveryProfile' do

    it { should_not be_valid }

  end

  context ' a validated DeliveryProfile with Name and SourceAddressType' do
    before(:each) do
      @delivery_profile = DeliveryProfile.new 'Name' => 'Test Profile', 'SourceAddressType' => 'DefaultPrivateIPAddress'
      @delivery_profile.valid?
    end

    subject { @delivery_profile }

    it { should be_valid }

  end

  context ' an invalid DeliveryProfiles' do
    before(:each) do
      @delivery_profile = DeliveryProfile.new
    end

    subject { @delivery_profile }


    it "without Name and SourceAddressType " do
      @delivery_profile.valid?
      @delivery_profile.should_not be_valid
    end

    context 'with Name' do
      before(:each) do
        @delivery_profile.Name = "Test profile"
      end

      it "and without SourceAddressType " do
        @delivery_profile.valid?
        @delivery_profile.should_not be_valid
      end

      it "and invalid SourceAddressType " do
        @delivery_profile.valid?
        @delivery_profile.SourceAddressType = 'IAmInvalidType'
        @delivery_profile.should_not be_valid
      end

    end


  end

end