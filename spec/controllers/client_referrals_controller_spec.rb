describe ClientReferralsController do
  subject { response }

  describe '#new' do
    before { get 'new' }

    it { is_expected.to be_ok }
    it { is_expected.to render_template('new') }
  end

  describe '#create' do
    let!(:facility_id) { FactoryGirl.create(:facility).id }
    let!(:client_referral_attributes) { FactoryGirl.attributes_for(:client_referral, facility_id: facility_id) }

    def go!
      post 'create', params: { client_referral: client_referral_attributes }
    end

    it 'creates expected ClientReferral' do
      expect { go! }.to change{ ClientReferral.count }.by(1)
      created_client_referral_attributes = HashWithIndifferentAccess.new(ClientReferral.last.attributes)
      expect(created_client_referral_attributes).to include(client_referral_attributes)
    end
  end
end
