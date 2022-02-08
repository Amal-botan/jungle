class User < ActiveRecord::Base
  has_secure_password
  
  validates :password, presence: true, confirmation: true, length: {minimum: 6}
  validates :password_confirmation, presence: true
  validates :email, uniqueness: {case_sensitive: false}
  
end
