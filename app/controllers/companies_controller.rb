#coding: utf-8
class CompaniesController < ApplicationController

  def create
    Company.create params[:company]
  end
end
