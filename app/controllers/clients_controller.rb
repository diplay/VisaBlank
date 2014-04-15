#coding: utf-8
class ClientsController < ApplicationController

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Manager.find(params[:manager_id]).clients.build
  end

  def create
    puts client_params.inspect
    @client = Manager.find(params[:manager_id]).clients.create(client_params)
    redirect_to client_path(@client)
  end

  def edit
    @client = Client.find(params[:id])
  end

  private
  def client_params
    params[:client].permit(:fio, :date_of_birth, :sex, :passport_number_series,
                          :passport_number, :passport_given_date,
                          :passport_given, :passport_given_code)
  end

end
