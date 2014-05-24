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

ActiveRecord::Schema.define(version: 20140413132047) do

  create_table "clients", force: true do |t|
    t.integer  "manager_id"
    t.text     "fio"
    t.text     "passport_number_series"
    t.text     "passport_number"
    t.text     "passport_given"
    t.date     "passport_given_date"
    t.text     "passport_given_code"
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

  create_table "company_document_data", force: true do |t|
    t.integer  "company_id"
    t.integer  "document_template_id"
    t.text     "client_price"
    t.text     "cost"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "company_document_data", ["company_id"], name: "index_company_document_data_on_company_id"
  add_index "company_document_data", ["document_template_id"], name: "index_company_document_data_on_document_template_id"

  create_table "document_orders", force: true do |t|
    t.text     "status"
    t.text     "comments"
    t.text     "client_price"
    t.text     "cost"
    t.integer  "client_id"
    t.integer  "document_template_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "document_orders", ["client_id"], name: "index_document_orders_on_client_id"
  add_index "document_orders", ["document_template_id"], name: "index_document_orders_on_document_template_id"

  create_table "document_templates", force: true do |t|
    t.text     "name"
    t.text     "template_path"
    t.text     "document_type"
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
    t.text     "password_digest"
    t.text     "role"
    t.text     "email"
    t.boolean  "active"
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
    t.integer  "aim"
    t.text     "aim_other"
    t.text     "country_of_destination"
    t.text     "first_enter_country"
    t.integer  "quantity_of_entries"
    t.text     "duration_of_stay"
    t.boolean  "visa_given"
    t.date     "visa_given1_from"
    t.date     "visa_given1_to"
    t.date     "visa_given2_from"
    t.date     "visa_given2_to"
    t.date     "visa_given3_from"
    t.date     "visa_given3_to"
    t.date     "visa_given4_from"
    t.date     "visa_given4_to"
    t.boolean  "fingerprints"
    t.date     "fingerprints_date"
    t.text     "entry_permit"
    t.date     "entry_permit_from"
    t.date     "entry_permit_to"
    t.date     "entry_date"
    t.date     "departure_date"
    t.text     "inviter_name"
    t.text     "inviter_adress_and_email"
    t.text     "inviter_phone"
    t.text     "inviter_company_name_and_adress"
    t.integer  "sponsor"
    t.text     "sponsor_other"
    t.integer  "means1"
    t.text     "means1_other"
    t.integer  "means2"
    t.text     "means2_other"
    t.text     "nearest_surname"
    t.text     "nearest_name"
    t.date     "nearest_date_of_birth"
    t.text     "nearest_nationality"
    t.text     "nearest_passport_number"
    t.integer  "nearest"
    t.text     "place"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "visa_data", ["client_id"], name: "index_visa_data_on_client_id"

end
