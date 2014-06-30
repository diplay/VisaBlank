#coding: utf-8
class Manager < ActiveRecord::Base
  belongs_to :company
  has_many :clients
  has_many :document_orders, through: :clients, order: 'updated_at DESC'
  has_one :user, as: :owner

  before_destroy :destroy_user

  accepts_nested_attributes_for :user

  def month_profit
    return 0
  end

  private
  def destroy_user
    user.destroy
  end

end
