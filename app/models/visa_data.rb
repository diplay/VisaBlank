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
    
    if self.client.sex == true
      return_attributes["sex_male"] = "Yes"
    else
      return_attributes["sex_female"] = "Yes"
    end
    
    return_attributes = travel_doc(return_attributes)
    return_attributes = residence(return_attributes)
    return_attributes = aimf(return_attributes)
    return_attributes = quantity_of_entr(return_attributes)
    return_attributes = visa_giv(return_attributes)
    return_attributes = fingerprints_foo(return_attributes)
    return_attributes = near(return_attributes)
    return_attributes = spons(return_attributes)
    return_attributes = means1_foo(return_attributes)
    return_attributes = means2_foo(return_attributes)
    
    return_attributes["place1"] = return_attributes["place"]
    return_attributes["date1"] = return_attributes["date"]
    
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
  
  def travel_doc(cur_attr)
    case cur_attr["travel_document_type"]
    when 0
      cur_attr["travel_document_type0"] = "Yes"
      cur_attr["travel_document_type0_other"] = cur_attr["travel_document_type_other"]
    when 1
      cur_attr["travel_document_type1"] = "Yes"
    when 2
      cur_attr["travel_document_type2"] = "Yes"
    when 3
      cur_attr["travel_document_type3"] = "Yes"
    when 4
      cur_attr["travel_document_type4"] = "Yes"
    when 5
      cur_attr["travel_document_type5"] = "Yes"
    end
    cur_attr
  end
  
  def residence(cur_attr)
    if cur_attr["residence_other_country"] = true
      cur_attr["residence_other_country_yes"] = "Yes"
      cur_attr["residence_document"] = cur_attr["residence_document_type"] + ", " + cur_attr["residence_document_number"]
    else
      cur_attr["valid_until"] = " "
      cur_attr["residence_other_country_no"] = "Yes"
    end
    cur_attr  
  end
  
  def aimf(cur_attr)
    case cur_attr["visa_aim"]
    when 0
      cur_attr["aim0"] = "Yes"
      cur_attr["aim0_other"] = cur_attr["visa_aim_other"]
    when 1
      cur_attr["aim1"] = "Yes"
    when 2
      cur_attr["aim2"] = "Yes"
    when 3
      cur_attr["aim3"] = "Yes"
    when 4
      cur_attr["aim4"] = "Yes"
    when 5
      cur_attr["aim5"] = "Yes"
    when 6
      cur_attr["aim6"] = "Yes"
    when 7
      cur_attr["aim7"] = "Yes"
    when 8
      cur_attr["aim8"] = "Yes"
    when 9
      cur_attr["aim9"] = "Yes"
    when 10
      cur_attr["aim10"] = "Yes"   
    end
    cur_attr
  end
  
  def quantity_of_entr(cur_attr)
    case cur_attr["quantity_of_entries"]
    when 1
      cur_attr["quantity_of_entries1"] = "Yes"
    when 2
      cur_attr["quantity_of_entries2"] = "Yes"
    when 3
      cur_attr["quantity_of_entries3"] = "Yes"
    end
    cur_attr
  end
  
  def visa_giv(cur_attr)
    if cur_attr["visa_given"] == true
      cur_attr["visa_given_true"] = "Yes"
    else
      cur_attr["visa_given_false"] = "Yes"
    end
    cur_attr
  end
  
  def fingerprints_foo(cur_attr)
    if cur_attr["fingerprints"] == true
      cur_attr["fingerprints_true"] = "Yes"
    else
      cur_attr["fingerprints_false"] = "Yes"
    end
    cur_attr
  end
  
  def near(cur_attr)
    case cur_attr["nearest"]
    when 1
      cur_attr["nearest1"] = "Yes"
    when 2
      cur_attr["nearest2"] = "Yes"
    when 3
      cur_attr["nearest3"] = "Yes"
    when 4
      cur_attr["nearest4"] = "Yes"
    end
    cur_attr
  end
  
  def spons(cur_attr)
    case cur_attr["sponsor"]
    when 1
      cur_attr["sponsor1"] = "Yes"
    when 2
      cur_attr["sponsor2"] = "Yes"
    when 3
      cur_attr["sponsor3"] = "Yes"
    when 0
      cur_attr["sponsor0"] = "Yes"
      cur_attr["sponsor0_other"] = cur_attr["sponsor_other"]
    end
    cur_attr
  end
  
  def means1_foo(cur_attr)
    case cur_attr["means1"]
    when 1
      cur_attr["means1_1"] = "Yes"
    when 2
      cur_attr["means1_2"] = "Yes"
    when 3
      cur_attr["means1_3"] = "Yes"
    when 4
      cur_attr["means1_4"] = "Yes"
    when 5
      cur_attr["means1_5"] = "Yes"
    when 0
      cur_attr["means1_0"] = "Yes"
      cur_attr["means1_0_other"] = cur_attr["means1_other"]
    end
    cur_attr
  end
  
  def means2_foo(cur_attr)
    case cur_attr["means2"]
    when 1
      cur_attr["means2_1"] = "Yes"
    when 2
      cur_attr["means2_2"] = "Yes"
    when 3
      cur_attr["means2_3"] = "Yes"
    when 4
      cur_attr["means2_4"] = "Yes"
    when 0
      cur_attr["means2_0"] = "Yes"
      cur_attr["means2_0_other"] = cur_attr["means2_other"]
    end
    cur_attr
  end
end
