class Recipe
  attr_reader :name

  def initialize(name)
    @name = name
    @ingredients = Hash.new(0)
  end

  def ingredients_required
    @ingredients
  end

  def ingredients
    @ingredients.keys
  end

  def add_ingredient(ingredient, amount)
    @ingredients[ingredient] += amount
  end
end
