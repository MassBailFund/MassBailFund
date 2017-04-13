FactoryGirl.define do
  sequence :address do
    "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.zip}, MA"
  end
end
