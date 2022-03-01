require 'rails_helper'

RSpec.describe Dish, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
    it {should validate_presence_of :description}
  end

  describe "relationships" do
    it {should belong_to :chef}
    it {should have_many(:ingredients).through(:dish_ingredients)}
  end

  it 'counts calories' do
    chef1 = Chef.create!(name: "Cookie Monster")
    dish1 = chef1.dishes.create!(name: "Chocolate Chip", description: "chocolate and chips")
    ingredient1 = Ingredient.create!(name: "chips", calories: 120)
    ingredient2 = Ingredient.create!(name: "doodles", calories: 33)
    ingredient3 = Ingredient.create!(name: "swiss", calories: 421)
    recipe1 = DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingredient1.id)
    recipe2 = DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingredient2.id)

    expect(dish1.total_calories).to eq(153)
  end
end
