#coding: utf-8
class VisaData < ActiveRecord::Base
  belongs_to :client
  
  def export(input_path, output_path)
    @pdftk ||= PdfForms.new('/usr/local/bin/pdftk')
    pdftk.fill_form input_path, output_path, get_attributes 
  end  
  
private
  def get_attributes
    return_attributes = attributes
    return_attributes[:marital_status0] = "Yes"
    return_attributes
  end
end
