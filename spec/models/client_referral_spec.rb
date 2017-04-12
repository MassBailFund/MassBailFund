describe ClientReferral do
  subject { FactoryGirl.create(:client_referral) }

  it { is_expected.to be_valid }
end
