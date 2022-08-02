require_relative './ingredient'
require_relative './recipe'

class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, count)
    @stock[ingredient] += count
  end

  def enough_ingredients_for?(recipe)
    ingredient_info = recipe.ingredients_required
    ingredients = ingredient_info.keys
    ingredients.all? { |ingr| stock_check(ingr) && stock_check(ingr) >= ingredient_info[ingr]}
  end
end
