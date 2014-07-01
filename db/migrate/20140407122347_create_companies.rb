class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.text :name, default: ""
      t.date :paid_before, default: "0001-01-01"
      t.text :tin, default: ""
      t.text :address, default: ""
      t.text :bank_details, default: ""
      t.text :phone, default: ""
      t.text :email, default: ""
      t.text :repr_i, default: ""
      t.text :repr_r, default: ""

      t.timestamps
    end
  end
end
