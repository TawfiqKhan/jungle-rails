require 'rails_helper'

RSpec.describe Product, type: :model do
  describe "Validations" do
    it "Saves a valid product" do
      @category = Category.new(name: 'book')
      @product = Product.new(name: 'Lord of the rings', price_cents: 10.22, quantity: 5, category: @category)
      @product.save
      expect(@product).to be_valid
    end

    it "Validates Name" do
      @category = Category.new(name: 'book')
      @product = Product.create(name: nil, price_cents: 10.22, quantity: 5, category: @category)
      expect(@product.errors.full_messages[0]).to eq "Name can't be blank"
    end

    it "Validates Price" do
      @category = Category.create(name: 'book')
      @product = Product.create(name: 'Hamlet', price_cents: nil, quantity: 5, category: @category)
       expect(@product.errors.full_messages[0]).to eq "Price cents is not a number"
    end

    it "Validates quantity" do
      @category = Category.new(name: 'book')
      @product = Product.create(name: "Hamlet", price_cents: 10.55, quantity: nil, category: @category)
      expect(@product.errors.full_messages[0]).to eq "Quantity can't be blank"
    end

    it "Validates Category" do
      @product = Product.create(name: "Hamlet", price_cents: 10.55, quantity: 5, category: nil)
      expect(@product.errors.full_messages[0]).to eq "Category can't be blank"
    end

  end
end

