require 'spec_helper'

include ExactTargetSDK

describe CreateResponse do

  context 'a response with empty results, OK status, and a request id' do

    subject { CreateResponse.new(:create_response => { :overall_status => 'OK', :request_id => 'abc' }) }

    it 'should have OK overall status' do
      subject.OverallStatus.should == 'OK'
    end

    it 'should have request id' do
      subject.RequestID.should == 'abc'
    end

    it 'should have empty array for Results' do
      subject.Results.should == []
    end

  end

  context 'a response with one result' do

    subject { CreateResponse.new(:create_response => { :results => { :status_code => 1, :status_message => 'OK' } }) }

    it 'should have one-element array for Results' do
      subject.Results.should be_a Array
      subject.Results.size.should == 1
    end

    it 'should have a CreateResult in Results' do
      subject.Results.first.should be_a CreateResult
    end

  end

  context 'a response with three results' do

    subject { CreateResponse.new(:create_response => { :results => [ {}, {}, {} ] }) }

    it 'should have three CreateResult objects in Results' do
      subject.Results.size.should == 3
      subject.Results.each do |result|
        result.should be_a CreateResult
      end
    end

  end

end
