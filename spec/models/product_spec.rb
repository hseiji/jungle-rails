require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here

    it 'should save a product' do
      @category = Category.create(name: "Plants")
      @product = Product.new(
        name: "Dracaena Marginata",
        price: 20.00,
        quantity: 1,
        category_id: @category.id
      )
      expect(@product).to be_valid
    end

    it 'should get an error when product name is nil' do
      @category = Category.create(name: "Plants")
      @product = Product.new(
        name: nil,
        price: 20.00,
        quantity: 1,
        category_id: @category.id
      )
      expect(@product).to_not be_valid
      #puts @product.errors.full_messages
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end    

    it 'should get an error when product price is nil' do
      @category = Category.create(name: "Plants")
      @product = Product.new(
        name: "Money Tree",
        price_cents: nil,
        quantity: 1,
        category_id: @category.id
      )
      expect(@product).to_not be_valid
      #puts @product.errors.full_messages
    end    

    it 'should get an error when quantity is nil' do
      @category = Category.create(name: "Plants")
      @product = Product.new(
        name: "Money Tree",
        price: 10,
        quantity: nil,
        category_id: @category.id
      )
      expect(@product).to_not be_valid
      #puts @product.errors.full_messages
    end    

    it 'should get an error when category is nil' do
      @category = Category.create(name: "Plants")
      @product = Product.new(
        name: "Money Tree",
        price: 10,
        quantity: 3,
        category_id: nil
      )
      expect(@product).to_not be_valid
      #puts @product.errors.full_messages
    end  

  end
end