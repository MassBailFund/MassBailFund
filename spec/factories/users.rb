FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    confirmed_at { Date.today }

    trait :admin do
      admin { true }
    end

    factory :admin do
      :admin
    end
  end
end
