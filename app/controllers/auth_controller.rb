#coding: utf-8
class AuthController < ApplicationController

  def authenticate
    user = User.find_by(login: params[:login]).try(:authenticate,
                                                  params[:pass])
    unless user.nil? || user == false
      session[:user] = user
    else
      flash[:warning] = "Неверный логин или пароль"
    end
    redirect_to :back
  end

  def logout
    reset_session
    redirect_to root_path
  end

end
