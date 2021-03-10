Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :restaurants

  resources :orders

  resources :dishes

  resources :customized_ingredients do
    patch :decrease_amount
    patch :increase_amount
  end
end
