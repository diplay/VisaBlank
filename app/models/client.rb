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
      return "Мужской"
    when false
      return "Женский"
    end
  end

  def get_last_document_status
    last_active_document = document_orders.where.not(status: "Отдан клиенту").order(updated_at: :desc).limit(1).first
    if last_active_document.nil?
      nil
    else
      {document_string: "#{last_active_document.document_template.name}(#{last_active_document.status})",
      document: last_active_document}
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
