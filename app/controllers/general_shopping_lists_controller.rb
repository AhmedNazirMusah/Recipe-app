class GeneralShoppingListsController < ApplicationController
    def index
      @recipe_foods = RecipeFood.includes(:food, :recipe)
      @missing_ingredient = @recipe_foods.select { |ingredient| ingredient.quantity > ingredient.food.quantity }
      @missing_items = @missing_ingredient.map do |food_item|
        {
          name: food_item.food.name,
          quantity: food_item.quantity - food_item.food.quantity,
          price: food_item.food.price * (food_item.quantity - food_item.food.quantity)
        }
      end
      @total_price = @missing_items.map { |item_prices| item_prices[:price] }.sum
    end
  end
  