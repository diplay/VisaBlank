#coding: utf-8
class CompanyClaimsController < ApplicationController

  def index #просмотр списка заявок
    @claims = CompanyClaim.all
  end

  def new #форма создания новой заявки
    @claim = CompanyClaim.new
  end

  def create #создание заявки
    CompanyClaim.create company_claim_params
  end

  def edit #изменение заявки(ее статуса)
  end

  def destroy #удаление заявки
    claim = CompanyClaim.find params[:id]
    claim.destroy unless claim.nil?
  end

  def show #просмотр заявки(ее статуса)
  end

  private
    def company_claim_params
      params.require(:company_claim).permit(:name, :email, :phone)
    end

end
