
Rails.application.routes.draw do
  
  get 'sessions/new'

  get 'users/new'

  # rails generate controller StaticPages home help
  # created these two routes
  # Note: root and '#' makes the main page when logging on
  # Note: get and '/' makes additional pages
  
  root 'sessions#new'

  
  get 'help' => 'static_pages#help'
  get 'front' => 'users#front'
  get 'back' => 'users#back'
  get 'all' => 'users#all'
 # get 'home' => 'static_pages#home'
  get 'create' => 'users#new'
 # get 'users' => 'users#index'
 # post 'front' => 'sessions#new'

  
  # for logging in
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users
  
    
  

end
