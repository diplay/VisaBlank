#coding: utf-8
class Company < ActiveRecord::Base
  has_many :managers
  has_many :clients, through: :managers
  has_one :user, as: :owner
end
