Rails.application.routes.draw do
  devise_for :users, controllers: {confirmations: 'confirmations' }
  default_url_options :host => "localhost:3000" #default host can be anything
  resources :charges

  get '/', to: 'profiles#index', as: 'home'
  get '/profiles/new', to: 'profiles#new', as: 'new_profile'
  post '/profiles/new', to: 'profiles#create'
  get '/profiles/:id', to: 'profiles#show', as: 'profile'
  root to: 'profiles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end