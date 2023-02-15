Rails.application.routes.draw do
  devise_for :users
  root "foods#index"

  resources :foods, only: [:index, :new, :create, :destroy]
    resources :general_shopping_list, only: [:index]
      resources :recipes, only: [:index, :show, :new, :create, :edit, :destroy] do
          resources :recipe_foods, only: [:new, :create]
  end
  resources :recipe_food, only: [:destroy]
  resources :public_recipes, only: [:index]
end
