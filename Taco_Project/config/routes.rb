Rails.application.routes.draw do
  resources :coupons
  resources :categories
  resources :ingredients
  resources :tacos
  resources :locations
  resources :users
  resources :orders

  get '/about', to: 'application#about'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/', to: 'application#index'
  get '/logout', to: 'sessions#destroy'

  get '/delete_taco', to: 'tacos#destroy'

  get '/finalize', to: 'orders#finalize'
  get '/finalized', to: 'orders#finalized'

  get '/analytics', to: 'tacos#analytics'

  post '/add_signature', to: 'orders#add_signature'

  patch '/remove_taco', to: 'users#remove_taco'

end
