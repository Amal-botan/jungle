class User < ActiveRecord::Base
  has_secure_password
  
  validates :name, presence: true
  validates :password, presence: true, confirmation: true, length: {minimum: 6}
  validates :password_confirmation, presence: true
  validates :email, uniqueness: {case_sensitive: false}
  
  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip)
    user && user.authenticate(password)
  end

end
