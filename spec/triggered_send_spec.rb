require 'spec_helper'

include ExactTargetSDK

describe TriggeredSend do

  context 'a bare TriggeredSend' do

    it { should_not be_valid }

  end

  context 'a TriggeredSend with a TriggeredSendDefinition set' do

    subject { TriggeredSend.new 'TriggeredSendDefinition' => 'abc' }

    it { should be_valid }

  end

end
