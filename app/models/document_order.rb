class DocumentOrder < ActiveRecord::Base
  belongs_to :client
  belongs_to :document_template
end
