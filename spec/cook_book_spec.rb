require_relative '../lib/ingredient'
require_relative '../lib/pantry'
require_relative '../lib/recipe'
require_relative '../lib/cook_book'

RSpec.describe CookBook do
  describe 'Iteration 1 & 2' do
    before(:all) do
      @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
      @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
      @recipe1 = Recipe.new("Mac and Cheese")
      @recipe2 = Recipe.new("Cheese Burger")
      @recipe1.add_ingredient(@ingredient1, 2)
      @recipe1.add_ingredient(@ingredient1, 4)
      @recipe1.add_ingredient(@ingredient2, 8)
      @cookbook = CookBook.new
    end

    it 'exists' do
      expect(@cookbook).to be_instance_of(CookBook)
    end

    it 'starts with empty recipe array' do
      expect(@cookbook.recipes).to eq([])
    end

    it 'can add recipes' do
      @cookbook.add_recipe(@recipe1)
      @cookbook.add_recipe(@recipe2)
      expect(@cookbook.recipes).to eq([@recipe1, @recipe2])
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

      @cookbook = CookBook.new
      @cookbook.add_recipe(@recipe1)
      @cookbook.add_recipe(@recipe2)
    end

    it 'finds ingredients for recipes' do 
      expect(@cookbook.ingredients).to eq(["Cheese", "Macaroni", "Ground Beef", "Bun"])
    end

    it 'can find highest calorie meal' do
      expect(@cookbook.highest_calorie_meal).to eq(@recipe2)
    end
  end
end
