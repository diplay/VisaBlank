#coding: utf-8
class UsersController < ApplicationController
  before_action :check_owner

  def index

  end

  def show
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
