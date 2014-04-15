#coding: utf-8
class ForeignPassportData < ActiveRecord::Base
  belongs_to :client

  def previous_passport_string
    case previous_passport
    when 0
      return "Первичное"
    when 1
      return "Взамен использованного"
    when 2
      return "Взамен испорченного"
    when 3
      return "Взамен утраченного"
    end
  end
end
