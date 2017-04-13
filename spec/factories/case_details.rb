FactoryGirl.define do
  factory :case_detail do
    association :attorney
    association :third_party
    association :client
    association :facility
    docket_number { Faker::Number.number(8) }
    charges { Faker::Lorem.sentence }
    arraignment_date { Faker::Date.between(Date.today, 3.weeks.from_now) }
    appearance_date { Faker::Date.between(3.weeks.from_now, 2.month.from_now) }
    bail_amount { Faker::Number.between(50, 500) }
    gps_required { Faker::Boolean.boolean }
    court { Faker::Company.name }
    open_cases_description 'N/A'
    warrants_description 'N/A'
    support_person_description 'N/A'
    released_upon_posting_description 'N/A'
    school_description 'N/A'
    employment_description 'N/A'
    housing_description 'N/A'
    history_description 'N/A'
    additional_info 'N/A'
  end
end
