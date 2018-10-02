Rails.application.routes.draw do
  resources :coupons
  resources :categories
  resources :ingredients
  resources :tacos
  resources :locations
  resources :users
  resources :orders

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/', to: 'application#index'
  get '/logout', to: 'sessions#destroy'

  get '/finalize', to: 'orders#finalize'

end
