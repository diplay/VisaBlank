#coding: utf-8
class DocumentOrder < ActiveRecord::Base 
  require 'iconv'
  def to_iso
    
    c.iconv(self)
  end
  
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
    
    current_attributes = to_cp1251(current_attributes)
    
    pdftk.fill_form "#{Rails.root}/public/" + document_template.template_path, out_path, current_attributes
    out_path
  end

  private
  def set_status
    self.status = "Новый документ"
  end
  
  def to_cp1251(arr)
    c = Iconv.new('CP1251','UTF-8')
    arr.each do |key, val|
      arr[key] = c.iconv(val)      
    end
    arr
  end
end
