class PublicRecipesController < ApplicationController
  before_action :authenticate_user!
  def index
    @recipes = Recipe.includes(:user).where(public: 'yes').order(created_at: :desc)
  end
end
