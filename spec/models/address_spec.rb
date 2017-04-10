describe Address do
  subject { FactoryGirl.build(:address) }

  it { is_expected.to be_valid }

  context 'without address' do
    subject { FactoryGirl.build(:address, address: '') }

    it { is_expected.not_to be_valid }
  end
end
