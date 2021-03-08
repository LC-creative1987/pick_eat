Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
<<<<<<< HEAD
  resources :restaurants, only: [ :show, :index ]
=======

  resources :restaurants do
    resources :dishes
  end

  resources :users do
    resources :orders
  end
>>>>>>> a684d223e63200749ad43338211c794d5692422c
end
