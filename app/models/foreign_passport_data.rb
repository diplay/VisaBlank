#coding: utf-8
class ForeignPassportData < ActiveRecord::Base
  belongs_to :client
  
  def create_passport_18_up(output_path)
    Zip.unicode_names
    @zip_file = Zip::File.new("#{Rails.root}/lib/docx_templates/foreign_passport_18_up.docx")
   
    @document_content =  @zip_file.read("word/document.xml").force_encoding("utf-8")
    
    @document_content.sub!("fio", self.client.fio)
    @document_content.sub!("fiochanged", self.fio_changed)
    d = Date.today
    @document_content.sub!("%7", d.mday.to_s)
    @document_content.sub!("datemonth", self.client.date_to_s(d.mon))
    @document_content.sub!("%8", d.year.to_s)
    @document_content.sub!("dateofbirth", self.client.date_of_birth.to_s)
    @document_content.sub!("sex", self.client.sex_string)
    
    @document_content.sub!("placeofbirth", place_of_birth)
    @document_content.sub!("registration", registration)
    @document_content.sub!("address", address)
    @document_content.sub!("citizenship", citizenship)
    @document_content.sub!("citizenshipother", citizenship_other)
    @document_content.sub!("passser", client.passport_number_series)
    @document_content.sub!("passnum", client.passport_number)
    @document_content.sub!("%1", client.passport_given_date.day.to_s)
    @document_content.sub!("passmonth", client.date_to_s(client.passport_given_date.mon))
    @document_content.sub!("%2", client.passport_given_date.year.to_s)
    @document_content.sub!("passgiven", client.passport_given + ", код подразделения:" + client.passport_given_code)
    
    @document_content.sub!("aim", aim)
    @document_content.sub!("previouspassport", previous_passport.to_s)
    @document_content.sub!("secretaccess", secret_access)
    @document_content.sub!("contractliability", contract_liability)
    @document_content.sub!("militaryservice", military_service)
    @document_content.sub!("conviction", conviction)
    @document_content.sub!("courtobligations", court_obligations)
    
    @document_content.sub!("r221", attributes["job2_date_from"])
    for i in 1..10 do
      @document_content.sub!("r" + (i%10).to_s + "1", attributes["job" + i.to_s + "_date_from"])
      @document_content.sub!("r" + (i%10).to_s + "2", attributes["job" + i.to_s + "_date_to"])
      @document_content.sub!("r" + (i%10).to_s + "job", attributes["job" + i.to_s])
      @document_content.sub!("r" + (i%10).to_s + "address", attributes["job" + i.to_s + "_address"])
    end
    
    @document_content.sub!("lastser", old_passport_series)
    @document_content.sub!("lastnum", old_passport_number)
    @document_content.sub!("%3", old_passport_given_date.day.to_s)
    @document_content.sub!("lastmonth", client.date_to_s(old_passport_given_date.mon))
    @document_content.sub!("%4", old_passport_given_date.year.to_s)
    @document_content.sub!("lastgiven", old_passport_given)
    
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
    
    @document_content.sub!("fio", self.client.fio)
    @document_content.sub!("fiochanged", self.fio_changed)
    d = Date.today
    @document_content.sub!("%7", d.mday.to_s)
    @document_content.sub!("datemonth", self.client.date_to_s(d.mon))
    @document_content.sub!("%8", d.year.to_s)
    @document_content.sub!("dateofbirth", self.client.date_of_birth.to_s)
    @document_content.sub!("sex", self.client.sex_string)
    
    @document_content.sub!("placeofbirth", place_of_birth)
    @document_content.sub!("registration", registration)
    @document_content.sub!("address", address)
    @document_content.sub!("citizenship", citizenship)
    @document_content.sub!("citizenshipother", citizenship_other)
    @document_content.sub!("passnum", client.passport_number)
    @document_content.sub!("%1", client.passport_given_date.day.to_s)
    @document_content.sub!("passmonth", client.date_to_s(client.passport_given_date.mon))
    @document_content.sub!("%2", client.passport_given_date.year.to_s)
    @document_content.sub!("passgiven", client.passport_given + ", код подразделения:" + client.passport_given_code)
    @document_content.sub!("aim", aim)
    @document_content.sub!("previouspassport", previous_passport.to_s)
    @document_content.sub!("conviction", conviction)
    @document_content.sub!("courtobligations", court_obligations)

    @document_content.sub!("pfio", p_fio)
    @document_content.sub!("pfiochanged", p_fio_changed)
    @document_content.sub!("pdateofbirth", p_date_of_birth.to_s)
    @document_content.sub!("pplaceofbirth", p_place_of_birth)
    @document_content.sub!("psex", p_sex)
    @document_content.sub!("pregistration", p_registration)
    @document_content.sub!("paddress", p_address)
    @document_content.sub!("ppassser", p_pass_ser)
    @document_content.sub!("ppassnum", p_pass_num)
    @document_content.sub!("ppassgiven", p_pass_given)
    @document_content.sub!("%5", p_pass_given_date.day.to_s)
    @document_content.sub!("ppassmonth", client.date_to_s(p_pass_given_date.mon))
    @document_content.sub!("%6", p_pass_given_date.year.to_s)
    
    @document_content.sub!("lastser", old_passport_series)
    @document_content.sub!("lastnum", old_passport_number)
    @document_content.sub!("%3", old_passport_given_date.day.to_s)
    @document_content.sub!("lastmonth", client.date_to_s(old_passport_given_date.mon))
    @document_content.sub!("%4", old_passport_given_date.year.to_s)
    @document_content.sub!("lastgiven", old_passport_given)
    
    
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
