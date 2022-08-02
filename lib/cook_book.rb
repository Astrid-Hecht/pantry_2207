class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    @recipes.flat_map { |recipe| recipe.ingredients.map(&:name) }.uniq
  end

  def highest_calorie_meal
    @recipes.max_by{ |recipe| recipe.total_calories}
  end

  def date
    time = Time.new
    "#{time.month}-#{time.day}-#{time.year}"
  end

  def summary
    summary = []
    recip_name = @recipes.map {|recip| recip.name}
    ing = @recipes[0].ingredients_required
    ingredients = Hash[ing.map {|ing| {ingredient: ing[0].name, amount: "#{ing[1]} #{ing[0].unit}", total_calories: "test" }}]
    require'pry';binding.pry
  end

end
