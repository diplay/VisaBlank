class AddDescriptionLinkToDocumentTemplates < ActiveRecord::Migration
  def change
    add_column :document_templates, :description, :string
  end
end
