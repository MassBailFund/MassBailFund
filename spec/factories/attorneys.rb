FactoryGirl.define do
  factory :attorney do
    email { Faker::Internet.unique.email }
    association :address
    association :contact
  end
end
