class CreateCompanyClaims < ActiveRecord::Migration
  def change
    create_table :company_claims do |t|
      t.text :name
      t.text :email
      t.text :phone

      t.timestamps
    end
  end
end
