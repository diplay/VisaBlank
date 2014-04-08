#coding: utf-8
class CompanyClaimsController < ApplicationController

  def index #просмотр списка заявок
    @claims = CompanyClaim.find(:all, order: "status")
  end

  def new #форма создания новой заявки
    @claim = CompanyClaim.new
  end

  def create #создание заявки
    params[:company_claim][:status] = 0
    CompanyClaim.create company_claim_params
  end

  def edit #форма изменения заявки(ее статуса)
    @claim = CompanyClaim.find params[:id]
  end

  def update #изменение заявки(ее статуса)
    claim = CompanyClaim.find params[:id]
    if params[:commit] == "Принять заявку"
      claim.status = 1
      redirect_to new_company_path claim_id: claim.id
    else
      claim.status = 2
      redirect_to company_claims_path
    end
    claim.save
  end

  def destroy #удаление заявки
    claim = CompanyClaim.find params[:id]
    claim.destroy unless claim.nil?
    redirect_to company_claims_path
  end

  def show #просмотр заявки(ее статуса)
    @claim = CompanyClaim.find params[:id]
  end

  private
    def company_claim_params
      params[:company_claim].permit(:name, :email, :phone, :status)
    end

end
