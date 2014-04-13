class CreateCompanyDocumentData < ActiveRecord::Migration
  def change
    create_table :company_document_data do |t|
      t.references :company, index: true
      t.references :document_template, index: true
      t.text :client_price
      t.text :cost
      t.boolean :active

      t.timestamps
    end
  end
end
