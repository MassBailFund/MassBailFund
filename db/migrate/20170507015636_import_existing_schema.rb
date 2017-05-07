class ImportExistingSchema < ActiveRecord::Migration[5.0]
  def change
    # Remove already created tables that do not match schema in existing project
    remove_foreign_key "attorneys", "addresses"
    remove_foreign_key "attorneys", "contacts"
    remove_foreign_key "case_details", "attorneys"
    remove_foreign_key "case_details", "clients"
    remove_foreign_key "case_details", "facilities"
    remove_foreign_key "case_details", "third_parties"
    remove_foreign_key "client_referrals", "facilities"
    remove_foreign_key "clients", "addresses"
    remove_foreign_key "clients", "contacts"
    remove_foreign_key "third_parties", "addresses"
    remove_foreign_key "third_parties", "contacts"
    drop_table "attorneys"
    drop_table "contacts"
    drop_table "addresses"
    drop_table "case_details"
    drop_table "client_referrals"
    drop_table "clients"
    drop_table "third_parties"

    # Import the existing schema without modifications
    create_table "ATTACHMENTS", primary_key: "ATTACHMENT_ID", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
      t.integer "CLIENT_ID"
      t.string  "FILENAME"
      t.binary  "ATTACHMENT", limit: 65535
    end

    create_table "BAIL_STATUSES", primary_key: "BAIL_STATUS_ID", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
      t.string "BAIL_STATUS", limit: 100
    end

    create_table "CASE_STATUSES", primary_key: "CASE_STATUS_ID", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
      t.string "CASE_STATUS", limit: 100
    end

    create_table "CLIENTS", primary_key: "CLIENT_ID", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
      t.string   "NOTES",                  limit: 4000
      t.integer  "SCORE"
      t.integer  "REQUEST_STATUS_ID",                    default: 1
      t.integer  "BAIL_STATUS_ID",                       default: 1
      t.string   "DATE_RETURNED"
      t.string   "FUNDS_WITHDRAWAL_DATE"
      t.string   "ATTORNEY_FEE_STATUS"
      t.integer  "CASE_STATUS_ID",                       default: 1
      t.string   "CASE_DISPOSITION_DATE"
      t.string   "CASE_DISPOSITION"
      t.string   "BAILED_DATE"
      t.integer  "AMOUNT_POSTED"
      t.boolean  "POOLED"
      t.string   "POOLED_BY",              limit: 32
      t.integer  "COMMISSIONERS_FEE"
      t.datetime "TIME_STAMP"
      t.string   "ATTORNEY_NAME"
      t.string   "ATTORNEY_EMAIL",         limit: 100
      t.string   "ATTORNEY_PHONE",         limit: 100
      t.string   "ATTORNEY_ADDRESS"
      t.string   "CLIENT_NAME"
      t.string   "CLIENT_EMAIL",           limit: 100
      t.string   "CLIENT_PHONE",           limit: 100
      t.string   "CLIENT_ADDRESS"
      t.string   "CLIENT_DOB"
      t.string   "REFERENCE_NAME"
      t.string   "REFERENCE_RELATIONSHIP", limit: 100
      t.string   "REFERENCE_PHONE",        limit: 100
      t.string   "REFERENCE_ADDRESS"
      t.string   "DOCKET",                 limit: 100
      t.string   "CHARGES"
      t.string   "ARRAIGNMENT_DATE"
      t.string   "APPEARANCE_DATE"
      t.text     "BAIL_AMOUNT",            limit: 65535
      t.boolean  "GPS_REQUIRED"
      t.string   "COURT",                  limit: 100
      t.string   "FACILITY",               limit: 100
      t.string   "WARRANTS"
      t.string   "RELEASED_UPON_POSTING",  limit: 1000
      t.string   "SUPPORT_PERSON",         limit: 1000
      t.string   "OPEN_CASES",             limit: 1000
      t.string   "SCHOOL",                 limit: 1000
      t.string   "EMPLOYMENT",             limit: 1000
      t.string   "HOUSING",                limit: 1000
      t.string   "HISTORY",                limit: 1000
      t.string   "ADDITIONAL_INFO",        limit: 4000
      t.string   "SURETY_NAME"
      t.string   "BAIL_SLIP"
      t.string   "CLIENT_CODE",            limit: 32
      t.string   "DATE_STRING",            limit: 32
    end

    create_table "REQUEST_STATUSES", primary_key: "REQUEST_STATUS_ID", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
      t.string "REQUEST_STATUS", limit: 100
    end
  end
end
