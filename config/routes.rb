Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :restaurants

  resources :orders, only: :show

  resources :order_items, only: [:show, :create]

  resources :customized_ingredients, only: [] do
    patch :decrease_amount
    patch :increase_amount
  end

  resources :dishes, only: [:index, :show, :new, :create] do
    resources :dish_ingredients, only: [:show, :new, :create]
  end
end
