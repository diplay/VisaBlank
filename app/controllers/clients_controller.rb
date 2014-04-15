#coding: utf-8
class ClientsController < ApplicationController

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Manager.find(params[:manager_id]).clients.build
    @client.build_foreign_passport_data
    @client.build_visa_data
  end

  def create
    client = Manager.find(params[:manager_id]).clients.create(client_params)
    redirect_to client_path(client)
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    client = Client.find(params[:id])
    client.update(client_params)
    redirect_to client_path(client)
  end

  def destroy
    client = Client.find(params[:id])
    manager = client.manager
    client.destroy
    redirect_to manager_path(manager)
  end

  private
  def client_params
    params[:client].permit(:fio, :date_of_birth, :sex, :passport_number_series,
                          :passport_number, :passport_given_date,
                          :passport_given, :passport_given_code,
      foreign_passport_data_attributes: [:fio_changed, :place_of_birth,
        :registration, :citizenship, :citizenship_other, :aim,
        :previous_passport, :secret_access, :contract_liability,
        :military_service, :conviction, :court_obligations, :children,
        :employment_history, :old_passport_series, :old_passport_number,
        :old_passport_given, :old_passport_given_date])
  end

end
