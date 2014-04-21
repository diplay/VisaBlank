#coding: utf-8
class UsersController < ApplicationController
  before_action :check_owner, except: [:show]

  def index
    @users = User.all
  end

  def show
    @_user = User.find(params[:id])
    if @user.id != @_user.id
      redirect_to root_path
    end
  end

  def edit
  end

  private
  def check_owner
    unless @user.role == "admin" ||
      @user.id == params[:id]
      redirect_to root_path
    end
  end

end
