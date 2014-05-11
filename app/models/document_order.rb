#coding: utf-8
class DocumentOrder < ActiveRecord::Base
  belongs_to :client
  belongs_to :document_template
  before_create :set_status, on: :create

  def export
    out_path = "#{Rails.root}/public/pdf/DocumentForOrder" + id.to_s + ".pdf"
    pdf = PDF::Stamper.new("#{Rails.root}/public/pdf_templates/foreign.pdf") 
    pdf.text :fio, "аворал"
    pdf.text :nameLast, "Yates" 
    #send_data(pdf.to_s, :filename => out_path, :type => "application/pdf",:disposition => "inline")
    out_path
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
