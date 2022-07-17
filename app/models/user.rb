class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true
  validates_uniqueness_of :email
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true
  validates :password, length: { minimum: 8 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    # puts email.strip
    user = User.find_by_email(email.strip.downcase)
    
    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

end
