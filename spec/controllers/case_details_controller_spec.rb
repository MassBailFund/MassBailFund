describe CaseDetailsController do
  subject { response }

  describe '#new' do
    before { get 'new' }

    it { is_expected.to be_ok }
    it { is_expected.to render_template('new') }
  end

  describe '#create' do
    pending
  end
end
