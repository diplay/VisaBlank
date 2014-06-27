class CreateForeignPassportData < ActiveRecord::Migration
  def change
    create_table :foreign_passport_data do |t|
      t.references :client, index: true

      t.text :fio_changed, default: ""
      t.text :place_of_birth, default: ""
      t.text :registration, default: ""
      t.text :citizenship, default: ""
      t.text :citizenship_other, default: ""
      t.text :aim, default: ""
      t.integer :previous_passport, default: "1"
                            #получение первичное
                            #взамен использованного испорченного утраченного

      t.text :secret_access, default: ""
      t.text :contract_liability, default: ""
      t.text :military_service, default: ""
      t.text :conviction, default: ""
      t.text :court_obligations, default: ""
      t.text :children, default: ""
      t.text :employment_history, default: ""

      t.text :old_passport_series, default: ""
      t.text :old_passport_number, default: ""
      t.text :old_passport_given, default: ""
      t.date :old_passport_given_date, default: "01.01.0001"

      t.timestamps
    end
  end
end
