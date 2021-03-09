Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :restaurants

  resources :users do
    resources :orders
  end

  resources :dishes
end
