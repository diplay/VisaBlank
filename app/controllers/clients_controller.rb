#coding: utf-8
class ClientsController < ApplicationController

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Manager.find(params[:manager_id]).clients.new
    @client.build_visa_data
    @client.build_foreign_passport_data
  end

end
