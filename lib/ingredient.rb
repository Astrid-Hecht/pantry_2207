class Ingredient
  attr_reader :info_hash

  def initialize(info_hash)
    @info_hash = info_hash
  end

  def name
    @info_hash[:name]
  end

  def unit
    @info_hash[:unit]
  end

  def calories
    @info_hash[:calories]
  end
end
