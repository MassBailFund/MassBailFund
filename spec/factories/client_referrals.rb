FactoryGirl.define do
  factory :client_referral do
    association :facility

    attorney_name { Faker::Name.name }
    attorney_email { Faker::Internet.unique.email }
    attorney_phone { Faker::PhoneNumber.cell_phone }
    attorney_address { generate :address }

    client_name { Faker::Name.name }
    client_email { Faker::Internet.unique.email }
    client_phone { Faker::PhoneNumber.cell_phone }
    client_address { generate :address }
    client_birth_date { Faker::Date.birthday(14, 85) }

    third_party_name { Faker::Name.name }
    # no third_party_email { Faker::Internet.unique.email }
    third_party_phone { Faker::PhoneNumber.cell_phone }
    third_party_address { generate :address }
    third_party_relationship_to_client { ["Family", "Friend", "Wife", "Husband", "Boyfriend", "Girlfriend"].shuffle.first }

    docket_number { Faker::Number.number(8) }
    charges { Faker::Lorem.sentence }
    arraignment_date { Faker::Date.between(Date.today, 3.weeks.from_now) }
    appearance_date { Faker::Date.between(3.weeks.from_now, 2.month.from_now) }
    bail_amount { Faker::Number.between(50, 500) }
    gps_required { Faker::Boolean.boolean }
    court { Faker::Company.name }

    open_cases_description "N/A"
    warrants_description "N/A"
    support_person_description "N/A"
    released_upon_posting_description "N/A"
    school_description "N/A"
    employment_description "N/A"
    housing_description "N/A"
    history_description "N/A"
    additional_info_description "N/A"
  end
end
