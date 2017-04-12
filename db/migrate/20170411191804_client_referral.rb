class ClientReferral < ActiveRecord::Migration[5.0]
  def change
    create_table :client_referrals do |t|
      t.belongs_to :facility, foreign_key: true

      t.string :attorney_name
      t.string :attorney_email
      t.string :attorney_phone
      t.string :attorney_address

      t.string :client_name
      t.string :client_email
      t.string :client_phone
      t.string :client_address
      t.date :client_birth_date

      t.string :third_party_name
      t.string :third_party_email
      t.string :third_party_phone
      t.string :third_party_address
      t.string :third_party_relationship_to_client

      t.string :docket_number
      t.string :charges
      t.date :arraignment_date
      t.date :appearance_date
      t.decimal :bail_amount
      t.boolean :gps_required
      t.string :court

      t.boolean :has_open_cases
      t.string :open_cases_description
      t.boolean :has_warrants
      t.string :warrants_description
      t.boolean :has_support_person
      t.string :support_person_description
      t.boolean :released_upon_posting
      t.string :released_upon_posting_description
      t.boolean :has_school
      t.string :school_description
      t.boolean :has_employment
      t.string :employment_description
      t.boolean :has_housing
      t.string :housing_description

      t.string :history_description
      t.string :additional_info_description

      t.timestamps
    end

    add_index :client_referrals, [:attorney_email], unique: false
    add_index :client_referrals, [:client_email], unique: false
    add_index :client_referrals, [:third_party_email], unique: false
  end
end
