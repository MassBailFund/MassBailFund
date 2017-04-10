describe Contact do
  subject { FactoryGirl.create(:contact) }

  it { is_expected.to be_valid }
end
