Rails.application.routes.draw do
  devise_for :users, controllers: {confirmations: 'confirmations' }
  default_url_options :host => "localhost:3000" #default host can be anything
  resources :charges
# PROFILES ROUTES
  get '/', to: 'profiles#index', as: 'home'
  get '/profiles/new', to: 'profiles#new', as: 'new_profile'
  post '/profiles/new', to: 'profiles#create'
  get '/profiles/:id', to: 'profiles#show', as: 'profile'
  
  put "/profiles/:id", to: "profiles#update"
  patch "/profiles/:id", to: "profiles#update"
  get "/profiles/:id/edit", to: "profiles#edit", as: "edit_profile"
  delete "/profiles/:id", to: "profiles#destroy"


# BOOKINGS ROUTES
  get '/bookings', to: 'bookings#index', as: 'booking'
  get '/bookings/new', to: 'bookings/new', to: 'bookings#new', as: 'new_booking'
  post '/bookings/new', to: 'bookings#create'
  get '/bookings/:id', to: 'bookings#show', as: 'show_booking'


  get "/bookings/:id/edit", to: "bookings#edit", as: "edit_booking"
  put "/bookings/:id", to: "bookings#update"
  patch "/bookings/:id", to: "bookings#update", as: "update_booking"
  delete "/bookings/:id", to: "bookings#destroy", as: "delete_booking"

  root to: 'profiles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end