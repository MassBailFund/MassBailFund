FactoryGirl.define do
  factory :client do
    email { Faker::Internet.email }
    birth_date { Faker::Date.birthday(14, 85) }
    association :address
    association :contact
  end
end
