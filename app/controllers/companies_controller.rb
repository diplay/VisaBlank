#coding: utf-8
class CompaniesController < ApplicationController
  before_action :check_owner
  before_action :check_active, except: [:show]

  def new #форма создания новой компании
    claim = CompanyClaim.find params[:claim_id]
    @company = Company.new do |c|
      c.name = claim.name
      c.email = claim.email
      c.phone = claim.phone
      c.paid_before = Date.today.next_month
    end
  end

  def create #создание компании
    company = Company.create(company_creation_params)
    pass = gen_password
    company.create_user(email: company.email, password: pass,
                       password_confirmation: pass, active: true)
    #TODO send mail with account information
    redirect_to company_path(company)
  end

  def index #список компаний
    @companies = Company.all
    @show_breadcrumb = false
  end

  def show #просмотр страницы компании
    @company = Company.find(params[:id])
  end

  def edit #форма редактирования данных о компании
    @company = Company.find(params[:id])
  end

  def update #сохранение данных о компании
    if @user.role != "admin"
      params[:company].delete(:paid_before)
    end
    Company.find(params[:id]).update(company_params)
    redirect_to company_path(params[:id])
  end

  private
  def company_params
    params[:company].permit(:name, :email, :phone, :address, :tin, :bank_details, :paid_before)
  end

  def company_creation_params
    params[:company].permit(:name, :email, :phone, :paid_before)
  end

  def check_owner
    @show_breadcrumb = true
    unless @user.role == "admin" ||
      (@user.role == "company" && @user.owner.id == params[:id].to_i)
      redirect_to root_path
    end
  end

  def gen_password
    rand(36**10).to_s(36)
  end

end
