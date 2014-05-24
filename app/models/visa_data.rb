#coding: utf-8
class VisaData < ActiveRecord::Base
  belongs_to :client
  
  def create_pdf(input_path, output_path)
    pdftk = PdfForms.new('/usr/bin/pdftk')
    pdftk.fill_form input_path, output_path, get_attributes 
  end  
  
private
  def get_attributes
    return_attributes = attributes
    return_attributes = marital_stat(return_attributes)
    return_attributes["date_of_birth"] = self.client.date_of_birth.to_s    
    if return_attributes["sex"]
      return_attributes["sex_male"] = "Yes"
    else
      return_attributes["sex_female"] = "Yes"
    end
    return_attributes
  end
  
  def marital_stat(cur_attr)
    case cur_attr["marital_status"]
    when 0
      cur_attr["marital_status0"] = "Yes"
      cur_attr["marital_status0_other"] = cur_attr["marital_status_other"]
    when 1
      cur_attr["marital_status1"] = "Yes"
    when 2
      cur_attr["marital_status2"] = "Yes"
    when 3
      cur_attr["marital_status3"] = "Yes"
    when 4
      cur_attr["marital_status4"] = "Yes"
    when 5
      cur_attr["marital_status5"] = "Yes"
    end
    cur_attr
  end
end
