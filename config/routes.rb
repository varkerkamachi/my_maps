Rails.application.routes.draw do


  # devise for authentication .....
  devise_for :users

  
  resources :maps do
    # no value to a marker outside of it's associated map - should be nested
    resources :markers
  end

  # possible heads up display/dash ...
  root to: 'home#index'
end
