Rails.application.routes.draw do
  resources :records
  resources :reviews
  resources :contacts
  resources :services
  resources :users
  resources :user_sessions
  resources :welcomes

  # resources :sessions, only: [:new, :create, :destroy]
  root 'welcomes#index'

  # match '/new',    to: 'user_sessions#new',    via: 'get'
  #
  # match '/create',    to: 'user_sessions#create',    via: 'get'
  #
  # match '/destroy',    to: 'user_sessions#destroy',    via: 'get'

  match '/new',    to: 'welcomes#new',    via: 'get'
  match '/create',    to: 'welcomes#create',    via: 'get'
  match '/destroy',    to: 'welcomes#destroy',    via: 'get'

  match '/admin', to: 'users#admin', via: 'get'
  match '/master', to: 'users#master', via: 'get'
  match '/customer', to: 'users#customer', via: 'get'


  get 'user_sessions/new'

  get 'user_sessions/create'

  get 'user_sessions/destroy'

  get 'login' => 'user_sessions#new', :as => :login
  get 'logout' => 'user_sessions#destroy', :as => :logout

  #
  # get 'user_sessions/new'
  #
  # get 'user_sessions/create'
  #
  # get 'user_sessions/destroy'





end
