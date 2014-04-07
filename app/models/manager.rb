class Manager < ActiveRecord::Base
  belongs_to :company
  has_many :clients
end
