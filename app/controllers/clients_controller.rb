#coding: utf-8
class ClientsController < ApplicationController

  def show
    @client = Manager.find(params[:manager_id]).clients.find(params[:id])
  end

end
