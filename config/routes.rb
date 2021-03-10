Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :restaurants do
    resources :dishes, only: [:show, :create]
  end



  resources :dishes, only: [] do
      resources :dish_ingredients, only: :create
  end



  resources :orders

  resources :customized_ingredients do
    patch :decrease_amount
    patch :increase_amount
  end




end
