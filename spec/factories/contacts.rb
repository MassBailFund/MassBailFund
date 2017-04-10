FactoryGirl.define do
  factory :contact do
    name { Faker::Name.name }
    phone { Faker::PhoneNumber.cell_phone }
  end
end
