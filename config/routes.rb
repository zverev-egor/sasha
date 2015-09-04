Rails.application.routes.draw do
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
