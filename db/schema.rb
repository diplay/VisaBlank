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

ActiveRecord::Schema.define(version: 20150202190354) do

  create_table "clients", force: true do |t|
    t.integer  "manager_id"
    t.text     "fio",                    default: ""
    t.text     "passport_number_series", default: ""
    t.text     "passport_number",        default: ""
    t.text     "passport_given",         default: ""
    t.date     "passport_given_date",    default: '0001-01-01'
    t.text     "passport_given_code",    default: ""
    t.date     "date_of_birth",          default: '0001-01-01'
    t.boolean  "sex",                    default: true
    t.text     "address",                default: ""
    t.text     "phone",                  default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "clients", ["manager_id"], name: "index_clients_on_manager_id"

  create_table "companies", force: true do |t|
    t.text     "name",         default: ""
    t.date     "paid_before",  default: '0001-01-01'
    t.text     "tin",          default: ""
    t.text     "address",      default: ""
    t.text     "bank_details", default: ""
    t.text     "phone",        default: ""
    t.text     "email",        default: ""
    t.text     "repr_i",       default: ""
    t.text     "repr_r",       default: ""
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
    t.string   "client_payed"
    t.string   "cost_payed"
    t.date     "deadline"
  end

  add_index "document_orders", ["client_id"], name: "index_document_orders_on_client_id"
  add_index "document_orders", ["document_template_id"], name: "index_document_orders_on_document_template_id"

  create_table "document_templates", force: true do |t|
    t.text     "name"
    t.text     "template_path"
    t.text     "document_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
  end

  create_table "foreign_passport_data", force: true do |t|
    t.integer  "client_id"
    t.text     "fio_changed",             default: ""
    t.text     "place_of_birth",          default: ""
    t.text     "registration",            default: ""
    t.text     "address",                 default: ""
    t.text     "citizenship",             default: ""
    t.text     "citizenship_other",       default: ""
    t.text     "aim",                     default: ""
    t.integer  "previous_passport",       default: 1
    t.text     "conviction",              default: ""
    t.text     "court_obligations",       default: ""
    t.text     "old_passport_series",     default: ""
    t.text     "old_passport_number",     default: ""
    t.text     "old_passport_given",      default: ""
    t.date     "old_passport_given_date", default: '0001-01-01'
    t.text     "secret_access",           default: ""
    t.text     "contract_liability",      default: ""
    t.text     "military_service",        default: ""
    t.text     "job1_date_from",          default: ""
    t.text     "job1_date_to",            default: ""
    t.text     "job1",                    default: ""
    t.text     "job1_address",            default: ""
    t.text     "job2_date_from",          default: ""
    t.text     "job2_date_to",            default: ""
    t.text     "job2",                    default: ""
    t.text     "job2_address",            default: ""
    t.text     "job3_date_from",          default: ""
    t.text     "job3_date_to",            default: ""
    t.text     "job3",                    default: ""
    t.text     "job3_address",            default: ""
    t.text     "job4_date_from",          default: ""
    t.text     "job4_date_to",            default: ""
    t.text     "job4",                    default: ""
    t.text     "job4_address",            default: ""
    t.text     "job5_date_from",          default: ""
    t.text     "job5_date_to",            default: ""
    t.text     "job5",                    default: ""
    t.text     "job5_address",            default: ""
    t.text     "job6_date_from",          default: ""
    t.text     "job6_date_to",            default: ""
    t.text     "job6",                    default: ""
    t.text     "job6_address",            default: ""
    t.text     "job7_date_from",          default: ""
    t.text     "job7_date_to",            default: ""
    t.text     "job7",                    default: ""
    t.text     "job7_address",            default: ""
    t.text     "job8_date_from",          default: ""
    t.text     "job8_date_to",            default: ""
    t.text     "job8",                    default: ""
    t.text     "job8_address",            default: ""
    t.text     "job9_date_from",          default: ""
    t.text     "job9_date_to",            default: ""
    t.text     "job9",                    default: ""
    t.text     "job9_address",            default: ""
    t.text     "job10_date_from",         default: ""
    t.text     "job10_date_to",           default: ""
    t.text     "job10",                   default: ""
    t.text     "job10_address",           default: ""
    t.text     "p_fio",                   default: ""
    t.text     "p_fio_changed",           default: ""
    t.date     "p_date_of_birth",         default: '0001-01-01'
    t.text     "p_place_of_birth",        default: ""
    t.text     "p_sex",                   default: ""
    t.text     "p_registration",          default: ""
    t.text     "p_address",               default: ""
    t.text     "p_pass_ser",              default: ""
    t.text     "p_pass_num",              default: ""
    t.date     "p_pass_given_date",       default: '0001-01-01'
    t.text     "p_pass_given",            default: ""
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "foreign_passport_data", ["client_id"], name: "index_foreign_passport_data_on_client_id"

  create_table "managers", force: true do |t|
    t.integer  "company_id"
    t.text     "name",       default: ""
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
    t.text     "surname",                          default: ""
    t.text     "surname_at_birth",                 default: ""
    t.text     "name",                             default: ""
    t.text     "patronymic_name",                  default: ""
    t.text     "place_of_birth",                   default: ""
    t.text     "country_of_birth",                 default: ""
    t.text     "current_nationality",              default: ""
    t.text     "nationality_at_birth",             default: ""
    t.integer  "marital_status",                   default: 1
    t.text     "marital_status_other",             default: ""
    t.text     "guardian_data",                    default: ""
    t.text     "national_id",                      default: ""
    t.integer  "travel_document_type",             default: 1
    t.text     "travel_document_type_other",       default: ""
    t.text     "travel_document_number",           default: ""
    t.date     "travel_document_date_of_issue",    default: '0001-01-01'
    t.date     "travel_document_valid_until",      default: '0001-01-01'
    t.text     "travel_document_issued_by",        default: ""
    t.text     "home_address_and_email",           default: ""
    t.text     "phone",                            default: ""
    t.boolean  "residence_other_country",          default: false
    t.text     "residence_document_type",          default: ""
    t.text     "residence_document_number",        default: ""
    t.date     "valid_until",                      default: '0001-01-01'
    t.text     "current_occupation",               default: ""
    t.text     "employer_data",                    default: ""
    t.integer  "visa_aim",                         default: 1
    t.text     "visa_aim_other",                   default: ""
    t.text     "country_of_destination",           default: ""
    t.text     "first_enter_country",              default: ""
    t.integer  "quantity_of_entries",              default: 1
    t.text     "duration_of_stay",                 default: ""
    t.boolean  "visa_given",                       default: false
    t.date     "visa_given1_from",                 default: '0001-01-01'
    t.date     "visa_given1_to",                   default: '0001-01-01'
    t.date     "visa_given2_from",                 default: '0001-01-01'
    t.date     "visa_given2_to",                   default: '0001-01-01'
    t.date     "visa_given3_from",                 default: '0001-01-01'
    t.date     "visa_given3_to",                   default: '0001-01-01'
    t.date     "visa_given4_from",                 default: '0001-01-01'
    t.date     "visa_given4_to",                   default: '0001-01-01'
    t.boolean  "fingerprints",                     default: false
    t.date     "fingerprints_date",                default: '0001-01-01'
    t.text     "entry_permit",                     default: ""
    t.date     "entry_permit_from",                default: '0001-01-01'
    t.date     "entry_permit_to",                  default: '0001-01-01'
    t.date     "entry_date",                       default: '0001-01-01'
    t.date     "departure_date",                   default: '0001-01-01'
    t.text     "inviter_name",                     default: ""
    t.text     "inviter_address_and_email",        default: ""
    t.text     "inviter_phone",                    default: ""
    t.text     "inviter_company_name_and_address", default: ""
    t.text     "inviter_company_phone",            default: ""
    t.text     "inviter_company_contact_face",     default: ""
    t.integer  "sponsor",                          default: 1
    t.text     "sponsor_other",                    default: ""
    t.integer  "means1",                           default: 1
    t.text     "means1_other",                     default: ""
    t.integer  "means2",                           default: 1
    t.text     "means2_other",                     default: ""
    t.text     "nearest_surname",                  default: ""
    t.text     "nearest_name",                     default: ""
    t.date     "nearest_date_of_birth",            default: '0001-01-01'
    t.text     "nearest_nationality",              default: ""
    t.text     "nearest_passport_number",          default: ""
    t.integer  "nearest",                          default: 1
    t.text     "place",                            default: ""
    t.date     "date",                             default: '0001-01-01'
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "visa_data", ["client_id"], name: "index_visa_data_on_client_id"

end
