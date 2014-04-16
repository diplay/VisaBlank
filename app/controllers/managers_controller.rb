#coding: utf-8
class ManagersController < ApplicationController
  before_action :check_owner

  def new
    @manager.build_user
  end

  def create
    pass = rand(36**10).to_s(36)
    params[:manager][:user_attributes][:password] = pass
    params[:manager][:user_attributes][:password_confirmation] = pass
    manager = @company.managers.create(manager_params)
    #send email with password
    redirect_to company_manager_path(@company, manager)
  end

  def show
  end

  def edit
  end

  def update
    @manager.update(manager_update_params)
    redirect_to company_manager_path(@company, @manager)
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
    @company = Company.find_by(id: params[:company_id])
    @manager = Manager.find_by(id: params[:id]) || @company.managers.build
    @company = @manager.company if @company.nil?
    @show_breadcrumb = true
    unless @user.role == "admin" ||
      (@user.role == "company" && @user.owner.id == @company.id) ||
      (@user.role == "manager" && @user.owner.id == @manager.id)
      redirect_to root_path
    end
  end

end
