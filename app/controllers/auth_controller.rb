#coding: utf-8
class AuthController < ApplicationController

  def authenticate
    if @user != nil
      redirect_to root_path
    else
      user = User.find_by(login: params[:login]).try(:authenticate,
                                                     params[:pass])
      unless user.nil? || user == false
        session[:user_id] = user.id
      else
        flash[:warning] = "Неверный логин или пароль"
      end
      redirect_to :back
    end
  end

  def logout
    reset_session
    redirect_to root_path
  end

end
