#coding: utf-8
class Client < ActiveRecord::Base
  belongs_to :manager
  has_one :foreign_passport_data
  has_one :visa_data
  has_many :document_orders, order: 'updated_at DESC'
  after_create :set_documents_data, on: :create

  accepts_nested_attributes_for :foreign_passport_data
  accepts_nested_attributes_for :visa_data

  def sex_string
    case sex
    when true
      return "Мужской"
    when false
      return "Женский"
    end
  end

  def get_last_document_status
    last_active_document = document_orders.where.not(status: "Отдан клиенту").order(updated_at: :desc).limit(1).first
    if last_active_document.nil?
      nil
    else
      {document_string: "#{last_active_document.document_template.name}(#{last_active_document.status})",
      document: last_active_document}
    end
  end

  def gen_passport_contract( input_path, output_path)
    Zip.unicode_names
    @zip_file = Zip::File.new(input_path)

    @document_content =  @zip_file.read("word/document.xml").force_encoding("utf-8")
    @header_content =  @zip_file.read("word/header1.xml").force_encoding("utf-8")

    @document_content.gsub!("%name%", self.fio)
    d = Date.today
    @document_content.gsub!("%d%", d.mday.to_s)
    @document_content.gsub!("%m%", date_to_s(d.mon))
    @document_content.gsub!("%y%", d.year.to_s)
    @document_content.gsub!("%cname%", self.manager.company.name)
    @document_content.gsub!("%repr_i%", self.manager.company.repr_i)
    @document_content.gsub!("%repr_r%", self.manager.company.repr_r)
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

    output_path
  end

  def gen_visa_contract( input_path, output_path)
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
    output_path
  end
  
  
  def date_to_s(num)
    case num
    when 1
      return "январь"
    when 2
      return "февраль"
    when 3
      return "март"
    when 4
      return "апрель"  
    when 5
      return "май"
    when 6
      return "июнь"
    when 7
      return "июль"
    when 8
      return "август"
    when 9
      return "сентябрь"
    when 10
      return "октябрь"
    when 11
      return "ноябрь"
    when 12
      return "декабрь"
    end
  end
  
  private
  def set_documents_data
    if foreign_passport_data.nil?
      create_foreign_passport_data
    end
    if visa_data.nil?
      create_visa_data
    end
  end

end
