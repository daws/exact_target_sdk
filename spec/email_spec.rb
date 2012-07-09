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

  context ' an invalid Email with Name and Subject set' do
    before(:each) do
      @email = Email.new 'Subject' => 'Welcome to the Dark Side'
      @email.valid?
    end

    subject { @email }

    it {should_not be_valid}

  end

  context 'a Email object with given ID' do
    before(:each) do
      @email = Email.new 'ID' => '587'
      @email.valid?
    end

    subject { @email }

    it {should be_valid}

  end

end