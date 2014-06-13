#coding: utf-8
class ForeignPassportData < ActiveRecord::Base
  belongs_to :client
  
  def get_attributes
    r_attr = attributes
    r_attr[:sex] = client.sex_string
    r_attr[:fio] = client.fio
    r_attr[:passport_number_series] = client.passport_number_series.to_s
    r_attr[:passport_number] = client.passport_number.to_s
    r_attr[:passport_given] = client.passport_given #+ "код подразделения: " + client.passport_given_code
    r_attr[:passport_given_date_day] = client.passport_given_date.mday.to_s
    r_attr[:passport_given_date_month] = passport_given_date_month.to_s
    r_attr[:passport_given_date_year] = client.passport_given_date.year.to_s
    r_attr[:date_of_birth] = client.date_of_birth.to_s
    r_attr[:old_passport_given_date] = attributes[:old_passport_given_date].to_s
    r_attr[:previous_passport] = previous_passport_string
    r_attr
  end
  
  def create_pdf( input_path, output_path)
    pdf = PDF::Stamper.new(input_path)
    pdf.text :name, "Иван"
    pdf.save_as output_path
  end
  
  
  
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
