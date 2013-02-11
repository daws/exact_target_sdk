require 'spec_helper'
include ExactTargetSDK

describe List do
  context 'a bare List' do

    it { should_not be_valid }

  end

  context ' a validated List with ListName set' do
    before(:each) do
      @list = List.new 'ListName' => 'My Favourite List'
      @list.valid?
    end

    subject { @list }

    it {should be_valid}

  end

  context ' an invalid List without ListName' do
    before(:each) do
      @list = List.new
      @list.valid?
    end

    subject { @list }

    it {should_not be_valid}

  end

end