Rails.application.routes.draw do
  devise_for :users

      devise_scope  :user do
    get 'users/sign_out' => 'devise/sessions#destroy'
      end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "recipes#index"
    resources :foods, only: [:index, :new, :create, :destroy]
    resources :recipes, only: [:index, :show, :new, :create, :destroy] do
      resources :recipe_foods, only: [:create, :new, :destroy, :update, :edit] 
    end

  
  post 'toggle_visible', to: 'recipes#toggle_visible', as: 'toggle_visible'

  get '/public_recipes' => 'recipes#public_recipes'
  get '/shopping_list' => 'recipes#shopping_list'
end
