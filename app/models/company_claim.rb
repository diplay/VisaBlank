#coding: utf-8
class CompanyClaim < ActiveRecord::Base

  def status_string
    case status
    when 0
      return "Ожидает рассмотрения"
    when 1
      return "Принята"
    when 2
      return "Отклонена"
    end
  end

end
