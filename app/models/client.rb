#coding: utf-8
class Client < ActiveRecord::Base
  belongs_to :manager
  has_one :foreign_passport_data
  has_one :visa_data
  has_many :document_orders
  after_create :set_documents_data, on: :create
  
  accepts_nested_attributes_for :foreign_passport_data
  accepts_nested_attributes_for :visa_data

  def sex_string
    case sex
    when true
      return "мужской"
    when false
      return "женский"
    end
  end

  def check_nil
    attributes.each do |key, val|
      if val == nil
        attributes[key] = ' '
      end
      if val == ''
        attributes[key] = ' '
      end
    end
  end
end
