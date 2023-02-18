class RecipeFood < ApplicationRecord
  belongs_to :food
  belongs_to :recipe

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  def self.value(id)
    recipe_food = RecipeFood.find(id)
    Food.find(recipe_food.food_id).price * recipe_food.quantity
  end
end
