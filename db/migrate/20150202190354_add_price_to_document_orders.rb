class AddPriceToDocumentOrders < ActiveRecord::Migration
  def change
    add_column :document_orders, :client_payed, :string
    add_column :document_orders, :cost_payed, :string
  end
end
