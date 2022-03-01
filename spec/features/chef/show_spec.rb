require 'rails_helper'

RSpec.describe 'Chef Show Page' do
  it 'returns name of chef' do
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

    visit "chefs/#{chef1.id}"

    expect(page).to have_content(chef1.name)
    expect(page).to_not have_content(chef2.name)
  end

  it 'has a link to view all chefs ingredients' do
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

    visit "chefs/#{chef1.id}"

    click_link "Ingredients"

    expect(current_path).to eq "/chefs/#{chef1.id}/ingredients"
    
    expect(page).to have_content(ingredient1.name)
    expect(page).to have_content(ingredient1.name)
    expect(page).to_not have_content(ingredient3.name)
  end
end