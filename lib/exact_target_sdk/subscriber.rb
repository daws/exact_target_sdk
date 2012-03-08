module ExactTargetSDK

# Assumes that the "SubscriberKey feature" is not enabled on your account, and
# thus explicitly sets the SubscriberKey to be the same as the EmailAddress
# (and vice-versa). This allows all methods to be used without ever needing to 
# refer to the SubscriberKey (just use EmailAddress).
#
# If the SubscriberKey is explicitly set, it will be left alone (in case you do
# have the SubscriberKey feature enabled).
#
# When updating, the email address may be updated by setting the SubscriberKey
# property to the current email address, and the EmailAddress property to the
# new email address.
class Subscriber < APIObject

  property 'SubscriberKey', :required => true
  property 'EmailAddress', :required => true
  property 'EmailTypePreference'
  array_property 'Attributes'

  before_validation :sync_subscriber_key_and_email_address

  validates 'EmailTypePreference', :inclusion => { :allow_nil => true, :in => %w( HTML Text ) }

  private

  def sync_subscriber_key_and_email_address
    self.SubscriberKey = self.EmailAddress if self.SubscriberKey.nil?
    self.EmailAddress = self.SubscriberKey if self.EmailAddress.nil?
  end

end

end
