#coding: utf-8
class CompaniesController < ApplicationController

  def new
    claim = CompanyClaim.find params[:claim_id]
    @company = Company.new do |c|
      c.id = claim.id
      c.name = claim.name
      c.email = claim.email
      c.phone = claim.phone
    end
  end

  def create
    Company.create params[:company], without_protection: true
  end

  private
  def company_params
    params[:company].permit(:id, :name, :email, :phone)
  end
end
