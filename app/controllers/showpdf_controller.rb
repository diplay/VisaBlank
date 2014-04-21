class ShowpdfController < ApplicationController
  def pdf
    send_file DocumentOrder.new.export, type: 'application/pdf'
  end
end
