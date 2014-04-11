class User < ActiveRecord::Base
  belongs_to :owner, polymorphic: true
  has_secure_password
end
