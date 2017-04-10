FactoryGirl.define do
  factory :third_party do
    relationship_to_client { ["Family", "Friend", "Wife", "Husband", "Boyfriend", "Girlfriend"].shuffle.first }
    association :address
    association :contact
  end
end
