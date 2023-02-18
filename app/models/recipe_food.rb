class RecipeFood < ApplicationRecord
  belongs_to :food
  belongs_to :recipe

  def self.value(id)
    recipe_food = RecipeFood.find(id)
    Food.find(recipe_food.food_id).price * recipe_food.quantity
  end
end
