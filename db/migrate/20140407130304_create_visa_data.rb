class CreateVisaData < ActiveRecord::Migration
  def change
    create_table :visa_data do |t|
      t.references :client, index: true

      t.text :surname
      t.text :surname_at_birth
      t.text :name
      t.text :patronymic_name
      t.text :place_of_birth
      t.text :country_of_birth
      t.text :current_nationality
      t.text :nationality_at_birth
      t.integer :marital_status
      t.text :marital_status_other
      t.text :guardian_data
      t.text :national_id

      t.integer :travel_document_type
      t.text :travel_document_type_other
      t.text :travel_document_number
      t.date :travel_document_date_of_issue
      t.date :travel_document_valid_until
      t.text :travel_document_issued_by

      t.text :home_address_and_email
      t.text :phone

      t.boolean :residence_other_country
      t.text :residence_document_type
      t.text :residence_document_number
      t.date :valid_until

      t.text :current_occupation
      t.text :employer_data

      t.timestamps
    end
  end
end
