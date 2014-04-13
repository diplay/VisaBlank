#coding: utf-8
class Manager < ActiveRecord::Base
  belongs_to :company
  has_many :clients
  has_one :user, as: :owner
  accepts_nested_attributes_for :user

  def month_profit
    return 0
  end

end
