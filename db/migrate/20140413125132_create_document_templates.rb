class CreateDocumentTemplates < ActiveRecord::Migration
  def change
    create_table :document_templates do |t|
      t.text :name
      t.text :template_path
      t.text :document_type

      t.timestamps
    end
  end
end
