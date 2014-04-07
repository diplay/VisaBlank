class Company < ActiveRecord::Base
  has_many :managers
  has_many :clients, through: :managers
end
