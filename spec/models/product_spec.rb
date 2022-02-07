require 'rails_helper'
RSpec.describe Product, type: :model do
 
  describe 'Validations' do
    before(:all) do
      @category = Category.create(name: "Furniture")
    end

    it "product is created" do
      @product = Product.new
      expect(@product).to be_a Product
    end



    it "is not valid without a name" do
      @product = Product.new(name: nil, price: 500, quantity: 10, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "is not valid without a price" do
      @product = Product.new(name: "Chair", price: nil, quantity: 10, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it "is not valid without a price" do
      @product = Product.new(name: "Chair", price: 5000, quantity: nil, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "is not valid without a price" do
      @product = Product.new(name: "Chair", price: 5000, quantity: 50, category: nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end


  end

end