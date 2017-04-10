describe ThirdParty do
  subject { FactoryGirl.create(:third_party) }

  it { is_expected.to be_valid }
end
