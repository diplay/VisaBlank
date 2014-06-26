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
  
  def create_docx(input_path, output_path)
    diff = self.client.date_of_birth - Date.today
    if diff < Date.new("01.01.18")
      create_passport_18_down(input_path, output_path)
    else
      create_passport_18_up(input_path, output_path)
    end
  end
  
  def create_passport_18_up( input_path, output_path)
    Zip.unicode_names
    @zip_file = Zip::File.new(input_path)
   
    @document_content =  @zip_file.read("word/document.xml").force_encoding("utf-8")
    @header_content =  @zip_file.read("word/header1.xml").force_encoding("utf-8")
    
    @document_content.gsub!("%name%", self.fio)
    @document_content.gsub!("%repr_r%", self.manager.company.repr_r)
    d = Date.today
    @document_content.gsub!("%d%", d.mday.to_s)
    @document_content.gsub!("%m%", date_to_s(d.mon))
    @document_content.gsub!("%y%", d.year.to_s)
    @document_content.gsub!("%cname%", self.manager.company.name)
    @document_content.gsub!("%caddress%", self.manager.company.address)
    @document_content.gsub!("%cphone%", self.manager.company.phone)
    @document_content.gsub!("%cbank%", self.manager.company.bank_details)
    @document_content.gsub!("%address%", self.address)
    @document_content.gsub!("%phone%", self.phone)
    @header_content.gsub!("%cname%", self.manager.company.name)
    @header_content.gsub!("%caddress%", self.manager.company.address)
    @header_content.gsub!("%cphone%", self.manager.company.phone)
      Zip::OutputStream.open(output_path) do |zos|
        @zip_file.entries.each do |e|
          unless (e.name == "word/document.xml") || (e.name == "word/header1.xml")
            zos.put_next_entry(e.name)
            zos.print e.get_input_stream.read
          end
        end

        zos.put_next_entry("word/document.xml")
        zos.print  @document_content
        zos.put_next_entry("word/header1.xml")
        zos.print  @header_content
      end
  end
  
  
  def create_passport_18_down( input_path, output_path)
    Zip.unicode_names
    @zip_file = Zip::File.new(input_path)
   
    @document_content =  @zip_file.read("word/document.xml").force_encoding("utf-8")
    @header_content =  @zip_file.read("word/header1.xml").force_encoding("utf-8")
    
    @document_content.gsub!("%name%", self.fio)
    @document_content.gsub!("%repr_r%", self.manager.company.repr_r)
    d = Date.today
    @document_content.gsub!("%d%", d.mday.to_s)
    @document_content.gsub!("%m%", date_to_s(d.mon))
    @document_content.gsub!("%y%", d.year.to_s)
    @document_content.gsub!("%cname%", self.manager.company.name)
    @document_content.gsub!("%caddress%", self.manager.company.address)
    @document_content.gsub!("%cphone%", self.manager.company.phone)
    @document_content.gsub!("%cbank%", self.manager.company.bank_details)
    @document_content.gsub!("%address%", self.address)
    @document_content.gsub!("%phone%", self.phone)
    @header_content.gsub!("%cname%", "abc")
    @header_content.gsub!("%caddress%", self.manager.company.address)
    @header_content.gsub!("%cphone%", self.manager.company.phone)
      Zip::OutputStream.open(output_path) do |zos|
        @zip_file.entries.each do |e|
          unless (e.name == "word/document.xml") || (e.name == "word/header1.xml")
            zos.put_next_entry(e.name)
            zos.print e.get_input_stream.read
          end
        end

        zos.put_next_entry("word/document.xml")
        zos.print  @document_content
        zos.put_next_entry("word/header1.xml")
        zos.print  @header_content
      end
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
