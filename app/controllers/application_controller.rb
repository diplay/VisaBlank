#coding: utf-8
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :check_auth

  def index #главная страница
  end
  
  def file
    send_file "#{Rails.root}/public/pdftk.tar.gz", type: 'application/tar.gz' 
  end
  
  protected
  def check_active
    if @user.role == "manager" && @user.owner.company.active? == false
      flash[:warning] = "Ваша компания заблокирована"
      redirect_to :back
    elsif @user.role == "company" && @user.owner.active? == false
      flash[:warning] = "Сперва необходимо разблокировать компанию"
      redirect_to :back
    elsif @user.role == "manager" && @user.active? == false
      flash[:warning] == "Аккаунт заблокирован"
      redirect_to :back
    end
  end

  private
  def check_auth
    @user = User.find_by id: session[:user_id]
    if @user.nil? && params[:controller] != 'application'
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
