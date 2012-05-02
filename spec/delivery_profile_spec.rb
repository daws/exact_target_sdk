require 'spec_helper'
include ExactTargetSDK

describe DeliveryProfile do
  context 'a bare DeliveryProfile' do

    it { should_not be_valid }

  end

  context ' a validated DeliveryProfile with Name and SourceAddressType' do
    before(:each) do
      @delivery_profile = DeliveryProfile.new 'Name' => 'Test Profile',
                                              'SourceAddressType' => DeliveryProfileSourceAddressTypeEnum::DEFAULT_PRIVATE_IP_ADDRESS
      @delivery_profile.valid?
    end

    subject { @delivery_profile }

    it { should be_valid }

  end


end