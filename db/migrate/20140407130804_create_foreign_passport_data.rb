class CreateForeignPassportData < ActiveRecord::Migration
  def change
    create_table :foreign_passport_data do |t|
      t.references :client, index: true

      t.text :fio_changed
      t.text :place_of_birth
      t.text :registration
      t.text :citizenship
      t.text :citizenship_other
      t.text :aim
      t.integer :previous_passport #получение первичное
                            #взамен использованного испорченного утраченного

      t.text :secret_access
      t.text :contract_liability
      t.text :military_service
      t.text :conviction
      t.text :court_obligations
      t.text :children
      t.text :employment_history

      t.text :old_passport_series
      t.text :old_passport_number
      t.text :old_passport_given
      t.date :old_passport_given_date

      t.timestamps
    end
  end
end
