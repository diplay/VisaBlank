#coding: utf-8
class Company < ActiveRecord::Base
  has_many :managers
  has_many :clients, through: :managers
  has_many :document_orders, through: :clients
  has_many :company_document_data
  has_one :user, as: :owner

  def active?
    return Date.today <= paid_before
  end

end
