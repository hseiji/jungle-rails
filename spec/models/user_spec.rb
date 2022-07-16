require 'rails_helper'


RSpec.describe User, type: :model do
  
  describe 'Validations' do
    it 'should create an user if provided with a password and matching password confirmation' do
      @user = User.new(
        first_name: "Henry",
        last_name: "Taka",
        email: "henry@gmail.com",
        password: "123456",
        password_confirmation: "123456"
      )
      expect(@user).to be_valid
    end 
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end

end