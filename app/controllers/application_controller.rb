#coding: utf-8
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :check_auth

  def index #главная страница
  end

  def get_country_data #получение информации о заполнении(некуда было пихнуть)
    if params[:doc] != nil
      doc = DocumentTemplate.find(params[:doc])
      if doc.description != nil
        render text: open("#{Rails.root}/public/info/#{doc.description}", &:read)
      else
        render text: "Описание недоступно"
      end
    else
      render text: "Wrong request"
    end
  end

  protected
  def check_active
    if @user.role == "manager" && @user.owner.company.active? == false
      flash[:warning] = "Ваша компания заблокирована"
      redirect_to :back
    elsif @user.role == "company" && @user.owner.active? == false
      flash[:warning] = "Сперва необходимо разблокировать компанию"
      redirect_to :back
    end
  end

  private
  def check_auth
    @user = User.find_by id: session[:user_id]
    if @user.nil? && !(['application', 'auth', 'company_claims'].include?(params[:controller]))
      redirect_to root_path
    end
    if @user != nil && @user.active == false &&
      !(['users', 'auth'].include?(params[:controller]))
      redirect_to user_path(@user)
    end
    if @user != nil && @user.role == 'admin'
      @new_claims = CompanyClaim.where(status: 0).length
    end
  end

end
