Rails.application.routes.draw do
  devise_scope :user do
    authenticated  do
      root to: 'foods#index'
   end

  unauthenticated do
        root to: 'devise/sessions#new', as: 'unauthenticated_root'
  end  
  get '/users/sign_out' => 'devise/sessions#destroy'
end
   
  devise_for :users ,controllers: { registrations: "registrations" }


  resources :foods, except: [:update]
  resources :recipes, except: [:update] do
    resources :recipe_foods, only: [:new, :edit, :create, :destroy, :update]
  end
  resources :public_recipes, except: [:update]
  resources :general_shopping_lists, except: [:update]
end

