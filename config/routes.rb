Rails.application.routes.draw do
  devise_for :users, controllers: {confirmations: 'confirmations', registrations: 'users/registrations' }
  default_url_options :host => "localhost:3000" 
  resources :charges

  # PROFILES ROUTES
  get '/index', to: 'profiles#index', as: 'index'
  get '/profiles/new', to: 'profiles#new', as: 'new_profile'
  post '/profiles/new', to: 'profiles#create'
  get '/profiles/:id', to: 'profiles#show', as: 'profile'
  get '/profiles/:id/students', to: 'profiles#my_students', as: 'my_students'

  put "/profiles/:id", to: "profiles#update"
  patch "/profiles/:id", to: "profiles#update"
  get "/profiles/:id/edit", to: "profiles#edit", as: "edit_profile"
  delete "/profiles/:id", to: "profiles#destroy"


  # BOOKINGS ROUTES
  get '/bookings', to: 'bookings#index', as: 'bookings'
  get '/bookings/new', to: 'bookings#new', as: 'new_booking'
  post '/bookings/new', to: 'bookings#create'
  get '/bookings/:id', to: 'bookings#show', as: 'booking'


  get "/bookings/:id/edit", to: "bookings#edit", as: "edit_booking"
  put "/bookings/:id", to: "bookings#update"
  patch "/bookings/:id", to: "bookings#update", as: "update_booking"
  delete "/bookings/:id", to: "bookings#destroy", as: "delete_booking"

  # REVIEWS ROUTES
  get '/reviews', to: 'reviews#index', as: 'reviews'
  get '/reviews/new', to: 'reviews#new', as: 'new_review'
  post '/reviews/new', to: 'reviews#create'
  get '/reviews/:id', to: 'reviews#show', as: 'review'

  get "/reviews/:id/edit", to: "reviews#edit", as: "edit_review"
  put "/reviews/:id", to: "reviews#update"
  patch "/reviews/:id", to: "reviews#update", as: "update_review"
  delete "/reviews/:id", to: "reviews#destroy", as: "delete_review"

  # PAGES ROUTES
  get '/', to: 'pages#home', as: 'home'
  get '/pages/about', to: 'pages#about', as: 'about'


  # Charges routes
  get '/charges', to: 'charges#index', as:'payment'
  root to: 'pages#home'


end