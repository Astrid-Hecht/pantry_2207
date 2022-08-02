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
    @recipes.each do |recipe|
      hash = Hash.new
      hash[:name] = recipe.name
      hash[:details] = recipe.ingredients_required.reduce(Hash.new) do |hash2, ingredient|
        hash2[:ingredients] = recipe.ingredients_required.map { |ingred| { ingredient: ingred[0].name, amount: "#{ingred[1]} #{ingred[0].unit}" } }
        hash2[:total_cal] = recipe.total_calories
        hash2
      end
      summary << hash
    end
  end
end
