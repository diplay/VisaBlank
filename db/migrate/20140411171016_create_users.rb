class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :owner, polymorphic: true, index: true
      t.text :login
      t.text :password_digest
      t.text :role

      t.timestamps
    end
  end
end
