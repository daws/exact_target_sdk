require 'spec_helper'

include ExactTargetSDK

describe APIObject do

  context 'a bare APIObject' do

    before(:each) do
      @bare_object = Class.new(APIObject) do
        def self.name; 'BareObject'; end
      end
    end

    subject { @bare_object.new }

    it { should be_valid }

    it 'should render empty string' do
      xml = Builder::XmlMarkup.new
      subject.render!(xml)
      xml.target!.should == ''
    end

    it 'should have a type_name of BareObject' do
      subject.type_name.should == 'BareObject'
    end

  end

  context 'an APIObject with namespaces in front of the class name' do

    before(:each) do
      @api_object = Class.new(APIObject) do
        def self.name; 'MyNamespace::SubNamespace::ObjectName'; end
      end
    end

    subject { @api_object.new }

    it 'should return only class name when calling type_name' do
      subject.type_name.should == 'ObjectName'
    end

  end

  context 'an APIObject with one optional property' do

    before(:each) do
      @bare_object = Class.new(APIObject) do
        property 'Foo'
      end
    end

    subject { @bare_object.new }

    it { should be_valid }

    it 'should have a getter for the property' do
      should respond_to 'Foo'
    end

    it 'should have a setter for the property' do
      should respond_to 'Foo='
    end

    it 'should render empty string when property is not set' do
      xml = Builder::XmlMarkup.new
      subject.render!(xml)
      xml.target!.should == ''
    end

    it 'should render property string when it is set' do
      subject.Foo = 'bar'
      xml = Builder::XmlMarkup.new
      subject.render!(xml)
      xml.target!.should == '<Foo>bar</Foo>'
    end

  end

  context 'an APIObject with one required property' do

    before(:each) do
      @api_object = Class.new(APIObject) do
        def self.name; 'SomeObject'; end
        property 'Foo', true
      end
    end

    subject { @api_object.new }

    it { should_not be_valid }

    it 'should be valid once property is set' do
      subject.Foo = 'bar'
      should be_valid
    end

  end

  context 'an APIObject with one array property' do

    before(:each) do
      @api_object = Class.new(APIObject) do
        array_property 'Foos'
      end
    end

    subject { @api_object.new }

    it { should be_valid }

    it 'should not render property when never set' do
      xml = Builder::XmlMarkup.new
      subject.render!(xml)
      xml.target!.should == ''
    end

    it 'should not render anything when property is read but empty' do
      subject.Foos
      xml = Builder::XmlMarkup.new
      subject.render!(xml)
      xml.target!.should == ''
    end

    it 'should render when appending item to property' do
      subject.Foos << 'bar'
      xml = Builder::XmlMarkup.new
      subject.render!(xml)
      xml.target!.should == '<Foos>bar</Foos>'
    end

    it 'should properly render multiple elements in sequence' do
      subject.Foos << 'cookie' << 'monster'
      xml = Builder::XmlMarkup.new
      subject.render!(xml)
      xml.target!.should == '<Foos>cookie</Foos><Foos>monster</Foos>'
    end

  end

  context 'an APIObject with one int property' do

    before(:each) do
      @api_object = Class.new(APIObject) do
        def self.name; 'SomeObject'; end
        int_property 'Foo'
      end
    end

    subject { @api_object.new }

    it { should be_valid }

    it 'should fail validation when given a string' do
      subject.Foo = 'test'
      subject.should_not be_valid
    end

    it 'should fail validation when given a decimal' do
      subject.Foo = 3.14
      subject.should_not be_valid
    end

    it 'should pass validation when given an integer' do
      subject.Foo = 3
      subject.should be_valid
    end

    it 'should pass validation when given zero' do
      subject.Foo = 0
      subject.should be_valid
    end

    it 'should pass validation when given a negative integer' do
      subject.Foo = -3
      subject.should be_valid
    end

    it 'should not render when not set' do
      xml = Builder::XmlMarkup.new
      subject.render!(xml)
      xml.target!.should == ''
    end

    it 'should render properly when set' do
      subject.Foo = 23
      xml = Builder::XmlMarkup.new
      subject.render!(xml)
      xml.target!.should == '<Foo>23</Foo>'
    end

  end

end
