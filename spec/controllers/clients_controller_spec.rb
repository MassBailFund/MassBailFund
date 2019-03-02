describe ClientsController do
  subject { response }

  describe '#new' do
    before { get 'new' }

    it { is_expected.to be_ok }
    it { is_expected.to render_template('new') }
  end

  describe '#create' do
    let!(:client_attributes) { FactoryBot.attributes_for(:client) }

    def go!
      post 'create', params: { client: client_attributes }
    end

    it 'creates expected Client' do
      expect { go! }.to change { Client.count }.by(1)
      created_client_attributes = HashWithIndifferentAccess.new(Hash[Client.last.attributes.map {|k,v| [k.downcase, v] }])
      expect(created_client_attributes).to include(client_attributes)
    end
  end
end
