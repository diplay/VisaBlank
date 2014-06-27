#coding: utf-8
class ManagersController < ApplicationController
  before_action :check_owner
  before_action :check_active, except: [:show]

  def new
    @manager.build_user
  end

  def create
    params[:manager][:user_attributes][:password] = "1234"
    params[:manager][:user_attributes][:password_confirmation] = "1234"
    params[:manager][:user_attributes][:role] = "manager"
    same_mail = User.find_by(email: params[:manager][:user_attributes][:email])
    puts same_mail.inspect
    if same_mail.nil?
      manager = @company.managers.create(manager_params)
      redirect_to manager_path(manager)
    else
      flash[:warning] = "Пользователь с таким email уже существует"
      redirect_to :back
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @manager.destroy
    redirect_to company_path(@company)
  end

  def update
    @manager.update(manager_update_params)
    redirect_to manager_path(@manager)
  end

  private
  def manager_params
    params[:manager].permit(:name,
                user_attributes: [:id, :role, :email, :password, :password_confirmation])
  end

  def manager_update_params
    params[:manager].permit(:name)
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
