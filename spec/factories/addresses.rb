FactoryGirl.define do
  factory :address do
    address "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.zip}, MA"
  end
end
