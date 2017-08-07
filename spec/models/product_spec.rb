require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    describe "#new" do

      it "should be valid with all fields present" do
        @category = Category.create name: "Test Category"
        @good_product = @category.products.create name: "Test Product", price: 100, quantity: 20, category: @category

        expect(@good_product).to be_valid
      end

      it "should have a name" do
        @category = Category.create name: "Test Category"
        @nameless_product = @category.products.create name: nil, price: 100, quantity: 20, category: @category

        expect(@nameless_product.errors.messages[:name]).to include("can't be blank")
      end

      it "should have a number for price" do
        @category = Category.create name: "Test Category"
        @no_price_product = @category.products.create name: "Test Product", quantity: 20, category: @category

        expect(@no_price_product.errors.messages[:price]).to include("can't be blank")
      end

      it "should have a number for quantity" do
        @category = Category.create name: "Test Category"
        @no_quantity_product = @category.products.create name: "Test Product", price: 100, quantity: nil, category: @category

        expect(@no_quantity_product.errors.messages[:quantity]).to include("can't be blank")
      end

      it "should have a category" do
        @no_category_product = Product.create name: "Test Product", price: 100, quantity: 20, category: nil

        expect(@no_category_product.errors.messages[:category]).to include("can't be blank")
      end
    end
  end
end