Rails.application.routes.draw do

  resources :coffeeshops
  # devise_for :users
  root 'users#index'
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
   resources :users, only: [:index, :show]
end
