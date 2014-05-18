#coding: utf-8
class DocumentOrder < ActiveRecord::Base
  belongs_to :client
  belongs_to :document_template
  before_create :set_status, on: :create

  def export()
    output_path = "#{Rails.root}/public/pdfs/DocumentOrder#{self.id}.pdf"
    input_path = self.document_template.template_path
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

  private
  def set_status
    self.status = "Новый документ"
  end

end
