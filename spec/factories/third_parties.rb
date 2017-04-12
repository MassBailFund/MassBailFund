FactoryGirl.define do
  factory :third_party do
    relationship_to_client { %w(Family Friend Wife Husband Boyfriend Girlfriend).sample }
    association :address
    association :contact
  end
end
