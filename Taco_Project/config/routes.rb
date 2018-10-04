Rails.application.routes.draw do
  # resources :coupons
  # resources :categories
  # resources :ingredients
  resources :tacos
  resources :locations
  resources :users, only: [:show, :edit, :update, :new, :create]
  resources :orders, only: [:index]

  # APPLICATION CONTROLLER
  get '/about', to: 'application#about'
    get '/', to: 'application#index'

  # SESSIONS CONTROLLER
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  # ORDERS CONTROLLER
  get '/finalize', to: 'orders#finalize'
  get '/finalized', to: 'orders#finalized'
  post '/add_signature', to: 'orders#add_signature'

  # TACOS CONTROLLER
  get '/delete_taco', to: 'tacos#destroy'
  get '/analytics', to: 'tacos#analytics'

  # ERRORS

  get '404', to: 'errors#notfound'

  patch '/remove_taco', to: 'users#remove_taco'

end
