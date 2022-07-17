require 'rails_helper'


RSpec.describe User, type: :model do
  
  describe 'Validations' do
    it 'should create an user if provided with a password and matching password confirmation' do
      @user = User.new(
        first_name: "Henr2",
        last_name: "Taka",
        email: "HeNr2@gmail.com",
        password: "123456789",
        password_confirmation: "123456789"
      )
      expect(@user).to be_valid
    end 

    it 'should not create an user if provided with a password and not matching password confirmation' do
      @user = User.new(
        first_name: "Henryy",
        last_name: "Taka",
        email: "henryy@gmail.com",
        password: "123456",
        password_confirmation: "1234567"
      )
      expect(@user).to_not be_valid
    end 

    it 'should not save if password is less than 8 characters' do
      @user = User.new(
        first_name: "Tom",
        last_name: "Hanks",
        email: "test@gmail.com",
        password: "1234567",
        password_confirmation: "1234567"
      )
      expect(@user).to_not be_valid
    end
   
  end

  describe '.authenticate_with_credentials' do
    it 'should not save for existing user' do
      @user = User.create(
          first_name: "Harry",
          last_name: "Potter",
          email: "harry@gmail.com",
          password: "123123123",
          password_confirmation: "123123123"
      )
      @user = User.new(
        first_name: "Harry",
        last_name: "Potter",
        email: "harry@gmail.com",
        password: "123123123",
        password_confirmation: "123123123"
      )
      expect(@user).to_not be_valid
    end

    it 'should return null if user is not registered' do
      @user = User.authenticate_with_credentials("test@gmail.com", "123456789")
      expect(@user).to eq(nil)
    end

    it 'should return the user if email is already registered' do
      @user = User.create(
          first_name: "Nick",
          last_name: "Fury",
          email: "nick@gmail.com",
          password: "123123123",
          password_confirmation: "123123123"
      )
      @user = User.authenticate_with_credentials("nick@gmail.com", "123123123")
      expect(@user.first_name).to eq("Nick")
    end

    it 'should authenticate when there is space before or after the email' do
      @user = User.create(
          first_name: "Mike",
          last_name: "Tyson",
          email: "mike@gmail.com",
          password: "123123123",
          password_confirmation: "123123123"
      )
      @user = User.authenticate_with_credentials(" mike@gmail.com", "123123123")
      expect(@user.first_name).to eq("Mike")
    end    

    it 'should authenticate when there upper/lower case in the email' do
      @user = User.create(
          first_name: "Mike",
          last_name: "Tyson",
          email: "mike@gmail.com",
          password: "123123123",
          password_confirmation: "123123123"
      )
      @user = User.authenticate_with_credentials(" mIkE@gmail.com", "123123123")
      expect(@user.first_name).to eq("Mike")
    end      
  end

end