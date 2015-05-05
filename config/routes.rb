Rails.application.routes.draw do

  resources :facilities
  resources :coffeeshops
  # devise_for :users
  #root 'users#index'
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
   resources :users, only: [:index, :show]
    resources :coffeeshops do
    resources :reviews, only: :create

    HighVoltage.configure do |config|
      config.home_page = 'home'
    end

  end

end
