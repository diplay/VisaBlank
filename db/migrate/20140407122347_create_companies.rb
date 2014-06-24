class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.text :name
      t.date :paid_before
      t.text :tin
      t.text :address
      t.text :bank_details
      t.text :phone
      t.text :email
      t.text :repr_i
      t.text :repr_r

      t.timestamps
    end
  end
end
