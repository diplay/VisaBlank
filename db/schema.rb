# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140411171016) do

  create_table "clients", force: true do |t|
    t.integer  "manager_id"
    t.text     "fio"
    t.text     "passport_number_series"
    t.text     "passport_number"
    t.text     "passport_given"
    t.date     "passport_given_date"
    t.date     "passport_given_code"
    t.date     "date_of_birth"
    t.boolean  "sex"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clients", ["manager_id"], name: "index_clients_on_manager_id"

  create_table "companies", force: true do |t|
    t.text     "name"
    t.date     "paid_before"
    t.text     "tin"
    t.text     "address"
    t.text     "bank_details"
    t.text     "phone"
    t.text     "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "company_claims", force: true do |t|
    t.text     "name"
    t.text     "email"
    t.text     "phone"
    t.integer  "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foreign_passport_data", force: true do |t|
    t.integer  "client_id"
    t.text     "fio_changed"
    t.text     "place_of_birth"
    t.text     "registration"
    t.text     "citizenship"
    t.text     "citizenship_other"
    t.text     "aim"
    t.integer  "previous_passport"
    t.text     "secret_access"
    t.text     "contract_liability"
    t.text     "military_service"
    t.text     "conviction"
    t.text     "court_obligations"
    t.text     "children"
    t.text     "employment_history"
    t.text     "old_passport_series"
    t.text     "old_passport_number"
    t.text     "old_passport_given"
    t.date     "old_passport_given_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "foreign_passport_data", ["client_id"], name: "index_foreign_passport_data_on_client_id"

  create_table "managers", force: true do |t|
    t.integer  "company_id"
    t.text     "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "managers", ["company_id"], name: "index_managers_on_company_id"

  create_table "users", force: true do |t|
    t.integer  "owner_id"
    t.string   "owner_type"
    t.text     "login"
    t.text     "password_digest"
    t.text     "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["owner_id", "owner_type"], name: "index_users_on_owner_id_and_owner_type"

  create_table "visa_data", force: true do |t|
    t.integer  "client_id"
    t.text     "surname"
    t.text     "surname_at_birth"
    t.text     "name"
    t.text     "patronymic_name"
    t.text     "place_of_birth"
    t.text     "country_of_birth"
    t.text     "current_nationality"
    t.text     "nationality_at_birth"
    t.integer  "marital_status"
    t.text     "marital_status_other"
    t.text     "guardian_data"
    t.text     "national_id"
    t.integer  "travel_document_type"
    t.text     "travel_document_type_other"
    t.text     "travel_document_number"
    t.date     "travel_document_date_of_issue"
    t.date     "travel_document_valid_until"
    t.text     "travel_document_issued_by"
    t.text     "home_address_and_email"
    t.text     "phone"
    t.boolean  "residence_other_country"
    t.text     "residence_document_type"
    t.text     "residence_document_number"
    t.date     "valid_until"
    t.text     "current_occupation"
    t.text     "employer_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "visa_data", ["client_id"], name: "index_visa_data_on_client_id"

end
