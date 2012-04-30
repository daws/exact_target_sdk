require 'spec_helper'
include ExactTargetSDK

describe EmailSendDefinition do
  context 'a bare EmailSendDefinition' do

    it { should_not be_valid }

  end

  context 'a validated EmailSendDefinition' do
    before(:each) do

      # Create List
      list = ExactTargetSDK::List.new('ID' => "273",
                                      'ListName' => "Test list")

      # Create SendClassification
      send_classification = ExactTargetSDK::SendClassification.new('ObjectID' => "1234b99-b592-e111-b32b-984be17c0e6c")

      # Create SendDefinitionList
      send_definition_list = ExactTargetSDK::SendDefinitionList.new('DataSourceTypeID' => 'List', 'List' => list)


      #Create Email
      email = ExactTargetSDK::Email.new('ID' => '239',
                                        'Name' => 'test',
                                        'Subject' => 'TestSubject',
                                        'HTMLBody' => '<h1>Body</h1>',
                                        'TextBody' => 'Body')

      @email_send_definition = ExactTargetSDK::EmailSendDefinition.new('Name' => 'test',
                                                                      'Email' => email,
                                                                      'SendClassification' => send_classification,
                                                                      'SendDefinitionList' => send_definition_list)
      @email_send_definition.valid?
    end

    subject { @email_send_definition }

    it { should be_valid }

  end

end