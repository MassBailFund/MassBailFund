describe Client do
  subject { FactoryGirl.create(:client) }

  it { is_expected.to be_valid }
end
