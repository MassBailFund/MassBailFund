describe Client do
  subject { FactoryBot.create(:client) }

  it { is_expected.to be_valid }
end
