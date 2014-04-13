#coding: utf-8
class ManagersController < ApplicationController
  before_action :check_owner

  def new
    @company = Company.find(params[:company_id])
    @manager = @company.managers.build
    @manager.build_user
  end

  def create
    pass = rand(36**10).to_s(36)
    params[:manager][:user_attributes][:password] = pass
    params[:manager][:user_attributes][:password_confirmation] = pass
    company = Company.find(params[:company_id])
    company.managers.create(manager_params)
    #send email with password
  end

  def show
    @manager = Manager.find(params[:id])
  end

  def edit
    @company = Company.find(params[:company_id])
    @manager = @company.managers.find(params[:id])
  end

  def update
    @manager = Manager.find(params[:id])
    @manager.update(manager_update_params)
    redirect_to company_manager_path(@manager.company, @manager)
  end

  private
  def manager_params
    params[:manager].permit(:name,
                user_attributes: [:id, :email, :password, :password_confirmation])
  end

  def manager_update_params
    params[:manager].permit(:name, user_attributes: [:id, :email])
  end

  def check_owner
    unless @user.role == "admin" ||
      (@user.role == "company" && @user.owner.id == params[:company_id].to_i) ||
      (@user.role == "manager" && @user.owner.id == params[:id].to_i)
      redirect_to root_path
    end
  end

end
