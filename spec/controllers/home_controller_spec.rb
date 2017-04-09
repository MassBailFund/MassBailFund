describe HomeController do
  subject { response }

  describe '#index' do
    before { get 'index' }

    it { is_expected.to be_ok }
  end
end
