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
    @_user.toggle_activation
    redirect_to :back
  end

  def change_password
  end

  def set_password
    result = @_user.change_password(params[:user][:old_password],
                                   params[:user][:password],
                                   params[:user][:password_confirmation])
    if result == :ok
      flash[:success] = "Пароль изменен"
      redirect_to user_path(@_user)
    elsif result == :fail_pass
      reset_session
      flash[:warning] = "Неверный пароль"
      redirect_to root_path
    elsif result == :fail_confirm
      flash[:warning] = "Пароли не совпадают"
      redirect_to :back
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
