#coding: utf-8
class DocumentOrder < ActiveRecord::Base
  belongs_to :client
  belongs_to :document_template
  before_create :set_status, on: :create

  def export
    input_path = self.document_template.template_path
    output_path = "#{Rails.root}/public/generated_documents/DocumentOrder#{self.id}.pdf"
    self.client.visa_data.create_pdf( input_path, output_path)
      
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

  def name_for_contract
  
  end
  
  private
  def set_status
    self.status = "Новый документ"
  end

end
