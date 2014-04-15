#coding: utf-8
class Client < ActiveRecord::Base
  belongs_to :manager
  has_one :foreign_passport_data
  has_one :visa_data
  has_many :document_orders
  after_create :set_documents_data, on: :create

  def sex_string
    case sex
    when true
      return "Мужской"
    when false
      return "Женский"
    end
  end

  private
  def set_documents_data
    if foreign_passport_data.nil?
      create_foreign_passport_data
    end
    if visa_data.nil?
      create_visa_data
    end
  end

end
