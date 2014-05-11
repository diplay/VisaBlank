#coding: utf-8
class VisaData < ActiveRecord::Base
  belongs_to :client
  
  def get_attributes
    return_attributes = attributes
    return_attributes[:marital_status0] = "Yes"
    return_attributes
  end
end
