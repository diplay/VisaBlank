#coding: utf-8
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :check_auth

  def index #главная страница
  end

  private
  def check_auth
    @user = User.find_by id: session[:user_id]
  end

end
