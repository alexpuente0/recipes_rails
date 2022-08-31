Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "recipes#index"
    resources :foods, only: [:index, :new, :create]
    resources :recipes, only: [:index, :show, :new, :create, :destroy]

  
  post 'toggle_visible', to: 'recipes#toggle_visible', as: 'toggle_visible'

end
