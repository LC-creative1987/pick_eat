Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :restaurants

  resources :users do
    resources :orders
  end

  resources :dishes do
    patch :increase_amount
    patch :decrease_amount
  end
end
