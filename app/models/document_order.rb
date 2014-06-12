#coding: utf-8
class DocumentOrder < ActiveRecord::Base
  belongs_to :client
  belongs_to :document_template
  before_create :set_status, on: :create

  def export()
    input_path = self.document_template.template_path
    output_path = "#{Rails.root}/public/pdfs/DocumentOrder#{self.id}."

    case self.document_template.document_type
    when 'visa'
      output_path += "pdf"
      self.client.visa_data.create_pdf( input_path, output_path)
    when 'foreign_passport'
      output_path += "pdf"
      self.client.foreign_passport_data.create_pdf( input_path, output_path)
    when 'passport_contract'
      output_path += "docx"
      self.client.gen_passport_contract( input_path, output_path)
    end
    output_path
  end

  def self.statuses
    [
      "Новый документ",
      "Анкеты готовы к отправке",
      "Анкеты отправлены",
      "Документ получен",
      "Отдан клиенту"
    ]
  end

  private
  def set_status
    self.status = "Новый документ"
  end

end
