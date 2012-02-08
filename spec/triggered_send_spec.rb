require 'spec_helper'

include ExactTargetSDK

describe TriggeredSend do

  context 'a bare TriggeredSend' do

    it { should_not be_valid }

  end

end
