require "pdf/stamper"

pdf = PDF::Stamper.new("austria.pdf")
pdf.text :name, "Jason"
pdf.text :surname, "Yates"
pdf.save_as "my_output.pdf"
