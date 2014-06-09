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
      
      t.integer :visa_aim
      t.text :visa_aim_other
      t.text :country_of_destination
      t.text :first_enter_country
      t.integer :quantity_of_entries
      t.text :duration_of_stay
      
      t.boolean :visa_given
      t.date :visa_given1_from
      t.date :visa_given1_to
      t.date :visa_given2_from
      t.date :visa_given2_to
      t.date :visa_given3_from
      t.date :visa_given3_to
      t.date :visa_given4_from
      t.date :visa_given4_to
      
      t.boolean :fingerprints
      t.date :fingerprints_date
      t.text :entry_permit
      t.date :entry_permit_from
      t.date :entry_permit_to
      
      t.date :entry_date
      t.date :departure_date
      
      t.text :inviter_name
      t.text :inviter_adress_and_email
      t.text :inviter_phone
      
      t.text :inviter_company_name_and_adress
      t.integer :sponsor
      t.text :sponsor_other
      t.integer :means1
      t.text :means1_other
      t.integer :means2
      t.text :means2_other
      
      t.text :nearest_surname
      t.text :nearest_name
      t.date :nearest_date_of_birth
      t.text :nearest_nationality
      t.text :nearest_passport_number
      t.integer :nearest
      
      t.text :place
      t.date :date   
      
      t.timestamps
    end
  end
end
