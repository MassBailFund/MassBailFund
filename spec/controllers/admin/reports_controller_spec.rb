describe Admin::ReportsController do
  subject { response }

  before(:each) do
    sign_in FactoryBot.create(:admin)
  end

  describe '#sureties' do
    before {
      @surety1 = Faker::Company.name
      @surety2 = Faker::Company.name

      FactoryBot.create_list(:client, 3, amount_posted: 100, surety_name: @surety1)
      FactoryBot.create_list(:client, 3, amount_posted: 1, surety_name: @surety2)

      get 'sureties'
    }

    it {
      is_expected.to be_ok
      expect(assigns(:sureties)).to satisfy { |sureties|
        expect(sureties[@surety1]).to eq(300)
        expect(sureties[@surety2]).to eq(3)
      }
    }
  end

  describe '#clients_by_month' do
    before {
      FactoryBot.create(:client, time_stamp: Date.parse("2018-01-01"))
      get 'clients_by_month'
    }

    it {
      is_expected.to be_ok
      expect(assigns(:monthly_requests)).to have_key(201801)
    }
  end

  describe '#clients_by_year' do
    before {
      FactoryBot.create(:client, time_stamp: Date.parse("2018-01-01"))
      get 'clients_by_year'
    }

    it {
      is_expected.to be_ok
      expect(assigns(:yearly_requests)).to have_key(2018)
    }
  end

  describe '#clients_for_year' do
    before {
      @client = FactoryBot.create(:client, time_stamp: Date.parse("2018-01-01"))
      get 'clients_for_year', params: { created_year: 2018 }
    }

    it {
      is_expected.to be_ok
      expect(assigns(:clients)).to include(@client)
    }
  end
end
