class NewReferralMailer < ApplicationMailer
  default from: 'referrals@massbailfund.org'

  def new_referral_email(client)
    @client = client
    @facilities = Facility.all
    toAddress = Setting.find_by(name: 'New referral to address').value
    subjectLine = 'New Bail Fund Request: ' + @client.client_name + ' - $' + client.bail_amount;
    mail(to: toAddress, subject: subjectLine)
  end
end
