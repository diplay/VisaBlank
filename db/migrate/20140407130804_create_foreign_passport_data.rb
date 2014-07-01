class CreateForeignPassportData < ActiveRecord::Migration
  def change
    create_table :foreign_passport_data do |t|
      t.references :client, index: true

      t.text :fio_changed, default: ""
      t.text :place_of_birth, default: ""
      t.text :registration, default: ""
      t.text :address, default: ""
      t.text :citizenship, default: ""
      t.text :citizenship_other, default: ""
      t.text :aim, default: ""
      t.integer :previous_passport, default: 1 #получение первичное #взамен использованного испорченного утраченного
      t.text :conviction, default: ""
      t.text :court_obligations, default: ""
      
      t.text :old_passport_series, default: ""
      t.text :old_passport_number, default: ""
      t.text :old_passport_given, default: ""
      t.date :old_passport_given_date, default: "0001-01-01"
      
#только взрослый      
      t.text :secret_access, default: ""
      t.text :contract_liability, default: ""
      t.text :military_service, default: ""

      t.text :job1_date_from, default: ""#1
      t.text :job1_date_to, default: ""
      t.text :job1, default: ""
      t.text :job1_address, default: ""
      
      t.text :job2_date_from, default: ""#2
      t.text :job2_date_to, default: ""
      t.text :job2, default: ""
      t.text :job2_address, default: ""
      
      t.text :job3_date_from, default: ""#3
      t.text :job3_date_to, default: ""
      t.text :job3, default: ""
      t.text :job3_address, default: ""
      
      t.text :job4_date_from, default: ""#4
      t.text :job4_date_to, default: ""
      t.text :job4, default: ""
      t.text :job4_address, default: ""
      
      t.text :job5_date_from, default: ""#5
      t.text :job5_date_to, default: ""
      t.text :job5, default: ""
      t.text :job5_address, default: ""
      
      t.text :job6_date_from, default: ""#6
      t.text :job6_date_to, default: ""
      t.text :job6, default: ""
      t.text :job6_address, default: ""
      
      t.text :job7_date_from, default: ""#7
      t.text :job7_date_to, default: ""
      t.text :job7, default: ""
      t.text :job7_address, default: ""
      
      t.text :job8_date_from, default: ""#8
      t.text :job8_date_to, default: ""
      t.text :job8, default: ""
      t.text :job8_address, default: ""
      
      t.text :job9_date_from, default: ""#9
      t.text :job9_date_to, default: ""
      t.text :job9, default: ""
      t.text :job9_address, default: ""
        
      t.text :job10_date_from, default: ""#10
      t.text :job10_date_to, default: ""
      t.text :job10, default: ""
      t.text :job10_address, default: ""
      
#только ребенок
      

      


      t.timestamps
    end
  end
end
