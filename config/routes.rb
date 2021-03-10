Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :restaurants

  resources :orders

  resources :customized_ingredients do
    patch :decrease_amount
    patch :increase_amount

  resources :dishes, only: [:index, :show, :new, :create] do
    resources :dish_ingredients, only: [:index, :show, :new, :create]
  end


end
