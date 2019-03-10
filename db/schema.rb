# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_03_06_203409) do

  create_table "ATTACHMENTS", primary_key: "ATTACHMENT_ID", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "CLIENT_ID"
    t.string "FILENAME"
    t.binary "ATTACHMENT"
  end

  create_table "BAIL_STATUSES", primary_key: "BAIL_STATUS_ID", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "BAIL_STATUS", limit: 100
  end

  create_table "CASE_STATUSES", primary_key: "CASE_STATUS_ID", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "CASE_STATUS", limit: 100
  end

  create_table "CLIENTS", primary_key: "CLIENT_ID", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "NOTES", limit: 4000
    t.integer "SCORE"
    t.integer "REQUEST_STATUS_ID", default: 1
    t.integer "BAIL_STATUS_ID", default: 1
    t.string "DATE_RETURNED"
    t.string "FUNDS_WITHDRAWAL_DATE"
    t.string "ATTORNEY_FEE_STATUS"
    t.integer "CASE_STATUS_ID", default: 1
    t.string "CASE_DISPOSITION_DATE"
    t.string "CASE_DISPOSITION"
    t.string "BAILED_DATE"
    t.integer "AMOUNT_POSTED"
    t.boolean "POOLED"
    t.string "POOLED_BY", limit: 32
    t.integer "COMMISSIONERS_FEE"
    t.datetime "TIME_STAMP"
    t.string "ATTORNEY_NAME"
    t.string "ATTORNEY_EMAIL", limit: 100
    t.string "ATTORNEY_PHONE", limit: 100
    t.string "ATTORNEY_ADDRESS"
    t.string "CLIENT_NAME"
    t.string "CLIENT_EMAIL", limit: 100
    t.string "CLIENT_PHONE", limit: 100
    t.string "CLIENT_ADDRESS"
    t.string "CLIENT_DOB"
    t.string "REFERENCE_NAME"
    t.string "REFERENCE_RELATIONSHIP", limit: 100
    t.string "REFERENCE_PHONE", limit: 100
    t.string "REFERENCE_ADDRESS"
    t.string "DOCKET", limit: 100
    t.string "CHARGES"
    t.string "ARRAIGNMENT_DATE"
    t.string "APPEARANCE_DATE"
    t.text "BAIL_AMOUNT"
    t.boolean "GPS_REQUIRED"
    t.string "COURT", limit: 100
    t.string "FACILITY", limit: 100
    t.string "WARRANTS"
    t.string "RELEASED_UPON_POSTING", limit: 1000
    t.string "SUPPORT_PERSON", limit: 1000
    t.string "OPEN_CASES", limit: 1000
    t.string "SCHOOL", limit: 1000
    t.string "EMPLOYMENT", limit: 1000
    t.string "HOUSING", limit: 1000
    t.string "HISTORY", limit: 1000
    t.string "ADDITIONAL_INFO", limit: 4000
    t.string "SURETY_NAME"
    t.string "BAIL_SLIP"
    t.string "CLIENT_CODE", limit: 32
    t.string "DATE_STRING", limit: 32
    t.string "CLIENT_RACE"
  end

  create_table "REQUEST_STATUSES", primary_key: "REQUEST_STATUS_ID", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "REQUEST_STATUS", limit: 100
  end

  create_table "courts", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_courts_on_name"
  end

  create_table "facilities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_facilities_on_name", unique: true
  end

  create_table "settings", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.string "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "versions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "item_type", limit: 191, null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object", limit: 4294967295
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

end
