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

ActiveRecord::Schema.define(version: 20170410034308) do

  create_table "addresses", force: :cascade do |t|
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attorneys", force: :cascade do |t|
    t.string   "email"
    t.integer  "address_id"
    t.integer  "contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_attorneys_on_address_id"
    t.index ["contact_id"], name: "index_attorneys_on_contact_id"
    t.index ["email"], name: "index_attorneys_on_email", unique: true
  end

  create_table "case_details", force: :cascade do |t|
    t.integer  "attorney_id"
    t.integer  "third_party_id"
    t.integer  "client_id"
    t.integer  "facility_id"
    t.string   "docket_number"
    t.string   "charges"
    t.date     "arraignment_date"
    t.date     "appearance_date"
    t.decimal  "bail_amount"
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
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.index ["attorney_id"], name: "index_case_details_on_attorney_id"
    t.index ["client_id"], name: "index_case_details_on_client_id"
    t.index ["facility_id"], name: "index_case_details_on_facility_id"
    t.index ["third_party_id"], name: "index_case_details_on_third_party_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string   "email"
    t.date     "birth_date"
    t.integer  "address_id"
    t.integer  "contact_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_clients_on_address_id"
    t.index ["contact_id"], name: "index_clients_on_contact_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facilities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_facilities_on_name", unique: true
  end

  create_table "third_parties", force: :cascade do |t|
    t.string   "relationship_to_client"
    t.integer  "address_id"
    t.integer  "contact_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["address_id"], name: "index_third_parties_on_address_id"
    t.index ["contact_id"], name: "index_third_parties_on_contact_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
