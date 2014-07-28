class AddDescriptionLinkToDocumentTemplates < ActiveRecord::Migration
  def change
    add_column :document_templates, :description_link, :string
  end
end
