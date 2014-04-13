class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :owner, polymorphic: true, index: true
      t.text :password_digest
      t.text :role
      t.text :email
      t.boolean :active

      t.timestamps
    end
  end
end
