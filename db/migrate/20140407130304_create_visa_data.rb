class CreateVisaData < ActiveRecord::Migration
  def change
    create_table :visa_data do |t|
      t.references :client, index: true

      t.text :surname, default: ""
      t.text :surname_at_birth, default: ""
      t.text :name, default: ""
      t.text :patronymic_name, default: ""
      t.text :place_of_birth, default: ""
      t.text :country_of_birth, default: ""
      t.text :current_nationality, default: ""
      t.text :nationality_at_birth, default: ""
      t.integer :marital_status, default: 1
      t.text :marital_status_other, default: ""
      t.text :guardian_data, default: ""
      t.text :national_id, default: ""

      t.integer :travel_document_type, default: 1
      t.text :travel_document_type_other, default: ""
      t.text :travel_document_number, default: ""
      t.date :travel_document_date_of_issue, default: "0001-01-01"
      t.date :travel_document_valid_until, default: "0001-01-01"
      t.text :travel_document_issued_by, default: ""

      t.text :home_address_and_email, default: ""
      t.text :phone, default: ""

      t.boolean :residence_other_country, default: false
      t.text :residence_document_type, default: ""
      t.text :residence_document_number, default: ""
      t.date :valid_until, default: "0001-01-01"

      t.text :current_occupation, default: ""
      t.text :employer_data, default: ""

      t.integer :visa_aim, default: 1
      t.text :visa_aim_other, default: ""
      t.text :country_of_destination, default: ""
      t.text :first_enter_country, default: ""
      t.integer :quantity_of_entries, default: 1
      t.text :duration_of_stay, default: ""

      t.boolean :visa_given, default: false
      t.date :visa_given1_from, default: "0001-01-01"
      t.date :visa_given1_to, default: "0001-01-01"
      t.date :visa_given2_from, default: "0001-01-01"
      t.date :visa_given2_to, default: "0001-01-01"
      t.date :visa_given3_from, default: "0001-01-01"
      t.date :visa_given3_to, default: "0001-01-01"
      t.date :visa_given4_from, default: "0001-01-01"
      t.date :visa_given4_to, default: "0001-01-01"

      t.boolean :fingerprints, default: false
      t.date :fingerprints_date, default: "0001-01-01"
      t.text :entry_permit, default: ""
      t.date :entry_permit_from, default: "0001-01-01"
      t.date :entry_permit_to, default: "0001-01-01"

      t.date :entry_date, default: "0001-01-01"
      t.date :departure_date, default: "0001-01-01"

      t.text :inviter_name, default: ""
      t.text :inviter_address_and_email, default: ""
      t.text :inviter_phone, default: ""

      t.text :inviter_company_name_and_address, default: ""
      t.text :inviter_company_phone, default: ""
      t.text :inviter_company_contact_face, default: ""
      
      t.integer :sponsor, default: 1
      t.text :sponsor_other, default: ""
      t.integer :means1, default: 1
      t.text :means1_other, default: ""
      t.integer :means2, default: 1
      t.text :means2_other, default: ""

      t.text :nearest_surname, default: ""
      t.text :nearest_name, default: ""
      t.date :nearest_date_of_birth, default: "0001-01-01"
      t.text :nearest_nationality, default: ""
      t.text :nearest_passport_number, default: ""
      t.integer :nearest, default: 1

      t.text :place, default: ""
      t.date :date, default: "0001-01-01"

      t.timestamps
    end
  end
end
