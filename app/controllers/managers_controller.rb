#coding: utf-8
class ManagersController < ApplicationController
  before_action :check_owner

  def show
    @manager = Manager.find(params[:id])
  end

  private
  def check_owner
    unless @user.role == "admin" ||
      (@user.role == "company" && @user.owner.id == params[:company_id].to_i) ||
      (@user.role == "manager" && @user.owner.id == params[:id].to_i)
      redirect_to root_path
    end
  end

end
