#coding: utf-8
class ForeignPassportData < ActiveRecord::Base
  belongs_to :client
  
  def create_passport_18_up(output_path)
    Zip.unicode_names
    @zip_file = Zip::File.new("#{Rails.root}/lib/docx_templates/foreign_passport_18_up.docx")
   
    @document_content =  @zip_file.read("word/document.xml").force_encoding("utf-8")
    
    @document_content.gsub!("%fio%", self.client.fio)
    @document_content.gsub!("%fio_changed%", self.fio_changed)
    d = Date.today
    @document_content.gsub!("%7", d.mday.to_s)
    @document_content.gsub!("%date_month%", self.client.date_to_s(d.mon))
    @document_content.gsub!("%8", d.year.to_s)
    @document_content.gsub!("%date_of_birth%", self.client.date_of_birth.to_s)
    @document_content.gsub!("%sex%", self.client.sex_string)
    
    
      Zip::OutputStream.open(output_path) do |zos|
        @zip_file.entries.each do |e|
          unless e.name == "word/document.xml"
            zos.put_next_entry(e.name)
            zos.print e.get_input_stream.read
          end
        end

        zos.put_next_entry("word/document.xml")
        zos.print  @document_content
      end
    output_path
  end
  
  
  def create_passport_18_down(output_path)
    Zip.unicode_names
    @zip_file = Zip::File.new("#{Rails.root}/lib/docx_templates/foreign_passport_18_down.docx")
   
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
