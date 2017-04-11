describe Ability do
  subject(:ability) { Ability.new(user) }

  context 'with nil' do
    let(:user) { nil }

    it { is_expected.not_to be_able_to(:manage, :all) }
    it { is_expected.to be_able_to(:new, ClientReferral) }
    it { is_expected.to be_able_to(:create, ClientReferral) }
  end
end
