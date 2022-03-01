require 'rails_helper'

RSpec.describe "Dish Show Page" do
  it 'returns a dish name and description' do
    chef1 = Chef.create!(name: "Cookie Monster")
    chef2 = Chef.create!(name: "Patrick Cheesy")
    dish1 = chef1.dishes.create!(name: "Chocolate Chip", description: "chocolate and chips")
    dish2 = chef1.dishes.create!(name: "Snickerdoodle", description: "snickers and doodles")
    dish3 = chef2.dishes.create!(name: "Swiss Roll Cakes", description: "cakes rolled in swiss")
    dish4 = chef2.dishes.create!(name: "Cheddar Bob", description: "b-rabbit sidekick")

    visit "dishes/#{dish1.id}"

    expect(page).to have_content(dish1.name)
    expect(page).to have_content(dish1.description)
  end

  it 'returns a list of ingredients for the dish and chefs name' do
    chef1 = Chef.create!(name: "Cookie Monster")
    chef2 = Chef.create!(name: "Patrick Cheesy")
    dish1 = chef1.dishes.create!(name: "Chocolate Chip", description: "chocolate and chips")
    dish2 = chef1.dishes.create!(name: "Snickerdoodle", description: "snickers and doodles")
    dish3 = chef2.dishes.create!(name: "Swiss Roll Cakes", description: "cakes rolled in swiss")
    dish4 = chef2.dishes.create!(name: "Cheddar Bob", description: "b-rabbit sidekick")
    ingredient1 = Ingredient.create!(name: "chips", calories: 120)
    ingredient2 = Ingredient.create!(name: "doodles", calories: 33)
    ingredient3 = Ingredient.create!(name: "swiss", calories: 421)
    ingredient4 = Ingredient.create!(name: "b-rabbit", calories: 8)
    recipe1 = DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingredient1.id)
    recipe2 = DishIngredient.create!(dish_id: dish1.id, ingredient_id: ingredient2.id)
    recipe3 = DishIngredient.create!(dish_id: dish3.id, ingredient_id: ingredient3.id)
    recipe4 = DishIngredient.create!(dish_id: dish4.id, ingredient_id: ingredient4.id)

    visit "dishes/#{dish1.id}"
save_and_open_page
    expect(page).to have_content(ingredient1.name)
    expect(page).to have_content(ingredient2.name)
    expect(page).to have_content(chef1.name)
  end
end