Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :restaurants do
    resources :dishes, only: [:index, :new, :show, :create, :destroy]
    resources :ingredients, only: [:index, :new, :create]
  end

  resources :ingredients, only: [:edit, :update, :destroy, :show]


  resources :dishes, only: [:edit, :update, :create, :destroy, :show] do
      resources :dish_ingredients, only: :create
  end

  resources :dish_ingredients, only: [:update]
  resources :orders, only: :show


  resources :order_items, only: [:show, :create, :destroy] do
    resources :special_requests, only: [:create, :destroy]
  end

  resources :special_requests, only: [] do
    patch :decrease_amount
    patch :increase_amount
  end

  resources :customized_ingredients, only: [] do
    patch :decrease_amount
    patch :increase_amount
  end

  get "/my_restaurants", to: 'dashboard#my_restaurants'

end
