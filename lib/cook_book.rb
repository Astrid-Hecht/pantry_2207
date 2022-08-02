class CookBook
  attr_reader :recipes, :date

  def initialize
    @recipes = []
    time = Time.new
    @date = "#{time.month}-#{time.day}-#{time.year}"
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

  def summary
    summary = []
    @recipes.each do |recipe|
      hash = Hash.new
      hash[:name] = recipe.name
      hash[:details] = details_organizer(recipe)
      summary << hash
    end
    summary
  end

  def details_organizer(recipe)
    recipe.ingredients_required.reduce(Hash.new) do |hash2|
      hash2[:ingredients] = ingredient_organizer(recipe)
      hash2[:total_calories] = recipe.total_calories
      hash2
    end
  end

  def ingredient_organizer(recipe)
    recipe.ingredients_required.sort_by { |sort| sort[0].calories * sort[1] }.reverse
          .map { |ing| { ingredient: ing[0].name, amount: "#{ing[1]} #{ing[0].unit}" } }
  end
end
