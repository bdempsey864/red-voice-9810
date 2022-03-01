require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  it 'returns list of ingredients' do
    chef1 = Chef.create!(name: "Cookie Monster")
    dish1 = chef1.dishes.create!(name: "Chocolate Chip", description: "chocolate and chips")
    ingredient1 = Ingredient.create!(name: "chips", calories: 120)
    ingredient2 = Ingredient.create!(name: "doodles", calories: 33)
    ingredient3 = Ingredient.create!(name: "swiss", calories: 421)
    recipe1 = DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingredient1.id)
    recipe2 = DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingredient2.id)

    expect(chef1.list_of_ingredients).to eq(["chips", "doodles"])
    expect(chef1.list_of_ingredients).to_not eq(["swiss"])
  end
end
