class Ingredient < ApplicationRecord
  validates_presence_of :name, :calories
  has_many :dish_indredients
  has_many :dishes, through: :dish_indredients
end