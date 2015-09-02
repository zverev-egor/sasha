Rails.application.routes.draw do

  match '/new',    to: 'user_sessions#new',    via: 'get'

  match '/create',    to: 'user_sessions#create',    via: 'get'

  match '/destroy',    to: 'user_sessions#destroy',    via: 'get'
  # resources :user_sessions
  #
  # get 'login' => 'user_sessions#new', :as => :login
  # get 'logout' => 'user_sessions#destroy', :as => :logout

  resources :users



  root 'welcome#index'

end
