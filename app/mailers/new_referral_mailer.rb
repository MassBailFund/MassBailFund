class NewReferralMailer < ApplicationMailer
  default from: 'referrals@massbailfund.org'

  def new_referral_email(client)
    @client = client
    @facilities = Facility.all
    subjectLine = 'New Bail Fund Request: ' + @client.client_name + ' - $' + client.bail_amount;
    mail(to: 'allajdhoffman@gmail.com', subject: subjectLine)
  end
end
