require_relative '../lib/pantry'

RSpec.describe Pantry do
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
