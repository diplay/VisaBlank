  require 'pdf/stamper'
  out_path = "/home/alzater/VisaBlank/public/pdf/DocumentForOrder" + ".pdf"
  pdf = PDF::Stamper.new("public/pdf_templates/foreign.pdf") 
  p "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!12"
  pdf.text :fio, "аворалasd"
  pdf.text :nameLast, "Yates" 
  send_data(pdf.to_s, :filename => out_path, :type => "application/pdf",:disposition => "inline")
  p "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!123"
  out_path
