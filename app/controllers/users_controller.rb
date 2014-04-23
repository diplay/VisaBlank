#coding: utf-8
class UsersController < ApplicationController
  before_action :check_owner, except: [:show, :change_password, :set_password]
  before_action :check_user, only: [:show, :change_password, :set_password]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    @_user.active = !@_user.active
    @_user.save
    redirect_to :back
  end

  def change_password
  end

  def set_password
    #TODO don't forget to send email
    if @_user.try(:authenticate, params[:user][:old_password])
      if @_user.update(password: params[:user][:password],
                   password_confirmation: params[:user][:password_confirmation])
        flash[:success] = "Пароль изменен"
        redirect_to user_path(@_user)
      else
        flash[:warning] = "Пароли не совпадают"
        redirect_to user_path(@_user)
      end
    else
      reset_session
      flash[:warning] = "Неверный пароль"
      redirect_to root_path
    end
  end

  def edit
  end

  private
  def check_owner
    @_user = User.find_by(id: params[:id])
    unless @user.role == "admin" ||
      @user.id == params[:id]
      redirect_to root_path
    end
  end

  def check_user
    @_user = User.find(params[:id])
    if @user.id != @_user.id
      redirect_to root_path
    end
  end

end
