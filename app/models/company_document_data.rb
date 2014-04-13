class CompanyDocumentData < ActiveRecord::Base
  belongs_to :company
  belongs_to :document_template
end
