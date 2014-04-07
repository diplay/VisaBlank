class CreateManagers < ActiveRecord::Migration
  def change
    create_table :managers do |t|
      t.references :company, index: true
      t.text :name

      t.timestamps
    end
  end
end
