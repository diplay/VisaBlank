#coding: utf-8
class DocumentOrder < ActiveRecord::Base 
  #require 'iconv'
  require 'rjb'
  #$LOAD_PATH << './lib'
  #require '/home/alzater/VisaBlank/lib/itext-2.0.4.jar'
  belongs_to :client
  belongs_to :document_template
  before_create :set_status, on: :create

def export
    out_path = "#{Rails.root}/public/pdf/DocumentForOrder" + id.to_s + ".pdf"
    p "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1"
    p "#{Rails.root}/public/pdf_templates/foreign.pdf"
    pdf = PDF::Stamper.new("/home/alzater/VisaBlank/public/pdf_templates/foreign.pdf") 
    p "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!12"
    pdf.text :fio, "аворал"
    pdf.text :nameLast, "Yates" 
    send_data(pdf.to_s, :filename => out_path, :type => "application/pdf",:disposition => "inline")
    p "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!123"
    out_path
end

=begin
module Pdf
  include_package "com.itextpdf.text.pdf"
  include_package "java.io"

  def self.write
    reader = PdfReader.new('#{Rails.root}/public/' + document_template.template_path);
    stamper = PdfStamper.new(reader, FileOutputStream.new("#{Rails.root}/public/pdf/DocumentForOrder" + id.to_s + ".pdf"))
    form = stamper.acro_fields
    puts "Form has these fields: #{form.fields.key_set.to_a}"
    form.set_field("name", "94115")
    stamper.close
  end
end
  def export
    Pdf.write
  end

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
    
    puts current_attributes[:fio]
    pdftk.fill_form "#{Rails.root}/public/" + document_template.template_path , out_path, current_attributes
    out_path
  end
=end
  private
  def set_status
    self.status = "Новый документ"
  end
  
  def to_cp1251(arr)
    c = Iconv.new('CP1251','UTF-8')
    arr.each do |key, val|
      val = val.to_s
      arr[key] = c.iconv(val)    
    end
    arr
  end
end
