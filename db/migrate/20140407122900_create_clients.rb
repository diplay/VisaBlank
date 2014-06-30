class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.references :manager, index: true

      t.text :fio, default: ""
      t.text :passport_number_series, default: ""
      t.text :passport_number, default: ""
      t.text :passport_given, default: ""
      t.date :passport_given_date, default: ""
      t.text :passport_given_code, default: ""
      t.date :date_of_birth, default: ""
      t.boolean :sex, default: true
      t.text :address, default: ""
      t.text :phone, default: ""
      

      t.timestamps
    end
  end
end
