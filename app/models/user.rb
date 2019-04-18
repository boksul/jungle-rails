class User < ActiveRecord::Base
  has_secure_password

  # validates :email, presensce: true
  # validates :password, presence: true
end
