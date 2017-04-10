describe Attorney do
  subject { FactoryGirl.create(:attorney) }

  it { is_expected.to be_valid }
  its(:contact) { is_expected.to be_present }
  its(:address) { is_expected.to be_present }
end
