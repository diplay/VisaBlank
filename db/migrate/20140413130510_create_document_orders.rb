class CreateDocumentOrders < ActiveRecord::Migration
  def change
    create_table :document_orders do |t|
      t.text :status
      t.text :comments
      t.text :client_price
      t.text :cost
      t.references :client, index: true
      t.references :document_template, index: true

      t.timestamps
    end
  end
end
