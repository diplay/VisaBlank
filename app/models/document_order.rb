#coding: utf-8
class DocumentOrder < ActiveRecord::Base
  belongs_to :client
  belongs_to :document_template
  before_create :set_status, on: :create

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
