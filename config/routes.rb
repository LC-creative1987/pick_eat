Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :restaurants do
    resources :dishes
  end

  resources :users do
    resources :orders
  end
end
