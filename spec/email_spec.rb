require 'spec_helper'
include ExactTargetSDK

describe Email do
  context 'a bare Email' do

    it { should_not be_valid }

  end

  context ' a validated Email with Name and Subject set' do
    before(:each) do
      @email = Email.new 'Name' => 'Welcome email', 'Subject' => 'Welcome to the Dark Side'
      @email.valid?
    end

    subject { @email }

    it {should be_valid}

  end

end