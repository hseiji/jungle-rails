class User < ApplicationRecord
  has_secure_password

  def create
    if user = User.authenticate_with_credentials(params[:email], params[:password])
      # success logic, log them in
      return user
    else
      # failure, render login form
      return nil
    end
  end

  validates :email, presence: true
  validates_uniqueness_of :email
  validates :first_name, presence: true
  validates :last_name, presence: true

end
