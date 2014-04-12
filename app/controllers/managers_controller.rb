#coding: utf-8
class ManagersController < ApplicationController
  before_action :check_owner

  def new
    if @user.role == 'admin'
      company = Company.find(params[:company_id])
      company.managers.create name: "Новый Менеджер"
      redirect_to :back
    elsif @user.role == 'company'
      #redirect_to new_company_manager_claim_path
    end
  end

  def show
    @manager = Manager.find(params[:id])
  end

  def edit
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
