Rails.application.routes.draw do
  resources :coupons
  resources :categories
  resources :ingredients
  resources :tacos
  resources :locations
  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

end
