#coding: utf-8
class CompaniesController < ApplicationController
  before_action :check_owner
  before_action :check_active, except: [:show]

  def new #форма создания новой компании
    @show_breadcrumb = false
    claim = CompanyClaim.find params[:claim_id]
    @company = Company.new do |c|
      c.name = claim.name
      c.email = claim.email
      c.phone = claim.phone
      c.paid_before = Date.today.next_month
    end
  end

  def create #создание компании
    same_mail = User.find_by(email: company_creation_params[:email])
    puts same_mail.inspect
    unless same_mail.nil?
      flash[:warning] = "Пользователь с таким email уже существует"
      redirect_to :back
    else
      company = Company.create(company_creation_params)
      new_user = User.create(email: company.email, active: true, owner: company,
                            password: "1234", password_confirmation: "1234",
                            role: "company")
      redirect_to company_path(company)
    end
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
    params[:company].permit(:name, :email, :phone, :address, :tin, :bank_details, :paid_before, :repr_i, :repr_r)
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

end
