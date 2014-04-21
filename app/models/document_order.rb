#coding: utf-8
class DocumentOrder < ActiveRecord::Base
  belongs_to :client
  belongs_to :document_template
  before_create :set_status, on: :create

  attr_writer :template_path
  attr_reader :attributes

  def initialize
    fill_out
  end

  def export(output_file_path=nil)
    output_path = output_file_path || "#{Rails.root}/tmp/pdfs/#{SecureRandom.uuid}.pdf" # make sure tmp/pdfs exists
    pdftk.fill_form template_path, output_path, attributes
    output_path
  end

  def get_field_names 
    pdftk.get_field_names template_path
  end

  def template_path
    @template_path ||= "#{Rails.root}/public/pdf_templates/austria.pdf" # makes assumption about template file path unless otherwise specified
  end

  protected

  def attributes
    @attributes ||= {}
  end

  def fill(key, value)
    attributes[key.to_s] = value
  end

  def pdftk
    @pdftk ||= PdfForms.new(ENV['PDFTK_PATH'] || '/usr/local/bin/pdftk') # On my Mac, the location of pdftk was different than on my linux server.
  end

  def fill_out
    fill :surname, "Bod"
    fill :surname_at_birth, "BOD"
    fill :name, "Den"
  end

  private
  def set_status
    self.status = "Новый документ"
  end

end
