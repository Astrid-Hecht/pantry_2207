require_relative '../lib/pantry'

RSpec.describe Pantry do
  describe 'Iteration 1 & 2' do
    before(:all) do
      @ingredient1 = Ingredient.new( {name: "Cheese", unit: "oz", calories: 50} )
      @ingredient2 = Ingredient.new( {name: "Macaroni", unit: "oz", calories: 200} )
      @pantry = Pantry.new
    end

    it 'exists' do
      expect(@pantry).to be_instance_of(Pantry)
    end

    it 'has a stock' do
      expect(@pantry.stock).to eq({})
    end

    it 'counts stock of a certain ingredient' do
      expect(@pantry.stock_check(@ingredient1)).to eq(0)
    end

    it 'can restock' do
      @pantry.restock(@ingredient1, 5)
      @pantry.restock(@ingredient1, 10)
      expect(@pantry.stock_check(@ingredient1)).to eq(15)
      @pantry.restock(@ingredient2, 7)
      expect(@pantry.stock_check(@ingredient2)).to eq(7)
    end
  end

  describe 'Iteration 3' do
    before(:all) do
      @ingredient1 = Ingredient.new({ name: "Cheese", unit: "C", calories: 100 })
      @ingredient2 = Ingredient.new({ name: "Macaroni", unit: "oz", calories: 30 })
      @recipe1 = Recipe.new("Mac and Cheese")
      @recipe1.add_ingredient(@ingredient1, 2)
      @recipe1.add_ingredient(@ingredient2, 8)

      @ingredient3 = Ingredient.new({ name: "Ground Beef", unit: "oz", calories: 100 })
      @ingredient4 = Ingredient.new({ name: "Bun", unit: "g", calories: 75 })
      @recipe2 = Recipe.new("Cheese Burger")
      @recipe2.add_ingredient(@ingredient1, 2)
      @recipe2.add_ingredient(@ingredient3, 4)
      @recipe2.add_ingredient(@ingredient4, 1)

      @pantry = Pantry.new
      @pantry.restock(@ingredient1, 5)
      @pantry.restock(@ingredient1, 10)
    end

    it 'can tell if adequate ingredients' do 
      expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(false)
      @pantry.restock(@ingredient2, 7)
      expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(false)
      @pantry.restock(@ingredient2, 1)
      expect(@pantry.enough_ingredients_for?(@recipe1)).to eq(true)
    end
  end
end
