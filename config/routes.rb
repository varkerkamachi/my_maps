Rails.application.routes.draw do

  # devise for authentication .....
  devise_for :users

  
  resources :maps

  # 
  root to: 'home#index'
end
