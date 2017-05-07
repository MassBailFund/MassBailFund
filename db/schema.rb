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

ActiveRecord::Schema.define(version: 20170412225744) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attorneys", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email"
    t.integer  "address_id"
    t.integer  "contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_attorneys_on_address_id", using: :btree
    t.index ["contact_id"], name: "index_attorneys_on_contact_id", using: :btree
    t.index ["email"], name: "index_attorneys_on_email", unique: true, using: :btree
  end

  create_table "case_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "attorney_id"
    t.integer  "third_party_id"
    t.integer  "client_id"
    t.integer  "facility_id"
    t.string   "docket_number"
    t.string   "charges"
    t.date     "arraignment_date"
    t.date     "appearance_date"
    t.decimal  "bail_amount",                       precision: 10
    t.boolean  "gps_required"
    t.string   "court"
    t.string   "open_cases_description"
    t.string   "warrants_description"
    t.string   "support_person_description"
    t.string   "released_upon_posting_description"
    t.string   "school_description"
    t.string   "employment_description"
    t.string   "housing_description"
    t.string   "history_description"
    t.string   "additional_info"
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.index ["attorney_id"], name: "index_case_details_on_attorney_id", using: :btree
    t.index ["client_id"], name: "index_case_details_on_client_id", using: :btree
    t.index ["facility_id"], name: "index_case_details_on_facility_id", using: :btree
    t.index ["third_party_id"], name: "index_case_details_on_third_party_id", using: :btree
  end

  create_table "client_referrals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "facility_id"
    t.string   "attorney_name"
    t.string   "attorney_email"
    t.string   "attorney_phone"
    t.string   "attorney_address"
    t.string   "client_name"
    t.string   "client_email"
    t.string   "client_phone"
    t.string   "client_address"
    t.date     "client_birth_date"
    t.string   "third_party_name"
    t.string   "third_party_email"
    t.string   "third_party_phone"
    t.string   "third_party_address"
    t.string   "third_party_relationship_to_client"
    t.string   "docket_number"
    t.string   "charges"
    t.date     "arraignment_date"
    t.date     "appearance_date"
    t.decimal  "bail_amount",                        precision: 10
    t.boolean  "gps_required"
    t.string   "court"
    t.boolean  "has_open_cases"
    t.string   "open_cases_description"
    t.boolean  "has_warrants"
    t.string   "warrants_description"
    t.boolean  "has_support_person"
    t.string   "support_person_description"
    t.boolean  "released_upon_posting"
    t.string   "released_upon_posting_description"
    t.boolean  "has_school"
    t.string   "school_description"
    t.boolean  "has_employment"
    t.string   "employment_description"
    t.boolean  "has_housing"
    t.string   "housing_description"
    t.string   "history_description"
    t.string   "additional_info_description"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.index ["attorney_email"], name: "index_client_referrals_on_attorney_email", using: :btree
    t.index ["client_email"], name: "index_client_referrals_on_client_email", using: :btree
    t.index ["facility_id"], name: "index_client_referrals_on_facility_id", using: :btree
    t.index ["third_party_email"], name: "index_client_referrals_on_third_party_email", using: :btree
  end

  create_table "clients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email"
    t.date     "birth_date"
    t.integer  "address_id"
    t.integer  "contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_clients_on_address_id", using: :btree
    t.index ["contact_id"], name: "index_clients_on_contact_id", using: :btree
  end

  create_table "contacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facilities", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_facilities_on_name", unique: true, using: :btree
  end

  create_table "third_parties", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "relationship_to_client"
    t.integer  "address_id"
    t.integer  "contact_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["address_id"], name: "index_third_parties_on_address_id", using: :btree
    t.index ["contact_id"], name: "index_third_parties_on_contact_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  end

  create_table "versions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "item_type",  limit: 191,        null: false
    t.integer  "item_id",                       null: false
    t.string   "event",                         null: false
    t.string   "whodunnit"
    t.text     "object",     limit: 4294967295
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree
  end

  add_foreign_key "attorneys", "addresses"
  add_foreign_key "attorneys", "contacts"
  add_foreign_key "case_details", "attorneys"
  add_foreign_key "case_details", "clients"
  add_foreign_key "case_details", "facilities"
  add_foreign_key "case_details", "third_parties"
  add_foreign_key "client_referrals", "facilities"
  add_foreign_key "clients", "addresses"
  add_foreign_key "clients", "contacts"
  add_foreign_key "third_parties", "addresses"
  add_foreign_key "third_parties", "contacts"
end
