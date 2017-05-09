FactoryGirl.define do
  factory :client do
    #association :facility
    facility { generate :facility_name }

    attorney_name { Faker::Name.name }
    attorney_email { Faker::Internet.unique.email }
    attorney_phone { Faker::PhoneNumber.cell_phone }
    attorney_address { generate :address }

    client_name { Faker::Name.name }
    client_email { Faker::Internet.unique.email }
    client_phone { Faker::PhoneNumber.cell_phone }
    client_address { generate :address }
    client_dob { Faker::Date.birthday(14, 85).to_s }

    reference_name { Faker::Name.name }
    # no reference_email { Faker::Internet.unique.email }
    reference_phone { Faker::PhoneNumber.cell_phone }
    reference_address { generate :address }
    reference_relationship { %w(Family Friend Wife Husband Boyfriend Girlfriend).sample }

    docket { Faker::Number.number(8) }
    charges { Faker::Lorem.sentence }
    arraignment_date { Faker::Date.between(Date.today, 3.weeks.from_now).to_s }
    appearance_date { Faker::Date.between(3.weeks.from_now, 2.month.from_now).to_s }
    bail_amount { Faker::Number.between(50, 500).to_s }
    gps_required { Faker::Boolean.boolean }
    court { Faker::Company.name }

    open_cases 'N/A'
    warrants 'N/A'
    support_person 'N/A'
    released_upon_posting 'N/A'
    school 'N/A'
    employment 'N/A'
    housing 'N/A'
    history 'N/A'
    additional_info 'N/A'
  end
end
