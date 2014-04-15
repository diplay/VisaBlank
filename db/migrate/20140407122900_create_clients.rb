class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.references :manager, index: true

      t.text :fio
      t.text :passport_number_series
      t.text :passport_number
      t.text :passport_given
      t.date :passport_given_date
      t.text :passport_given_code
      t.date :date_of_birth
      t.boolean :sex

      t.timestamps
    end
  end
end
