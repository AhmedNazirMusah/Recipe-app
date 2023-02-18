class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods

  validates :name, presence: true
  validates :preparation_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :cooking_time, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }

  def recipe_list
    @recipe = Recipe.all.where(user_id: params[:id])
  end

  def total_price
    total = 0
    foods.each do |food|
      total += food.price
    end
    total
  end

  def missing_foods
    data = { list: [], count: 0, total_price: 0 }
    recipe_foods.includes(:food).each do |recipe_food|
      recipe_food_quantity = recipe_food.quantity
      food_inv_quantity = recipe_food.food.quantity

      next unless (food_inv_quantity.to_i - recipe_food_quantity.to_i).negative?

      data[:list] << recipe_food.food
      data[:count] += 1
      data[:total_price] += recipe_food.food.price
    end
    data
  end
end
