#coding: utf-8
class DocumentOrder < ActiveRecord::Base
  belongs_to :client
  belongs_to :document_template
  before_create :set_status, on: :create

  def export
    out_path = "#{Rails.root}/public/pdf/DocumentForOrder" + id.to_s + ".pdf"
    pdftk = PdfForms.new('/usr/bin/pdftk')
    case document_template.document_type
    when 'visa'
      current_attributes = client.visa_data.get_attributes
    when 'foreign_passport'
      current_attributes = client.foreign_passport_data.get_attributes
    end
    pdftk.fill_form "#{Rails.root}/public/" + document_template.template_path, out_path, current_attributes
    out_path
  end

  private
  def set_status
    self.status = "Новый документ"
  end
end
