class CreateCaseDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :case_details do |t|
      t.belongs_to :attorney, foreign_key: true
      t.belongs_to :third_party, foreign_key: true
      t.belongs_to :client, foreign_key: true
      t.belongs_to :facility, foreign_key: true
      t.string :docket_number
      t.string :charges
      t.date :arraignment_date
      t.date :appearance_date
      t.decimal :bail_amount
      t.boolean :gps_required
      t.string :court
      t.string :open_cases_description
      t.string :warrants_description
      t.string :support_person_description
      t.string :released_upon_posting_description
      t.string :school_description
      t.string :employment_description
      t.string :housing_description
      t.string :history_description
      t.string :additional_info

      t.timestamps
    end
  end
end
