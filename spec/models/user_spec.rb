require 'rails_helper'


RSpec.describe User, type: :model do
  
  describe 'Validations' do
    it 'should create an user' do
      @user = User.create(name: "Jack", password:"")

      expect(@product).to be_valid
    end   
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end

end