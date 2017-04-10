describe Facility do
  subject { FactoryGirl.build(:facility) }

  it { is_expected.to be_valid }

  context 'with same name as existing' do
    let!(:existing_facility) { FactoryGirl.create(:facility) }

    subject { FactoryGirl.build(:facility, name: existing_facility.name) }

    it { is_expected.not_to be_valid }
  end
end
