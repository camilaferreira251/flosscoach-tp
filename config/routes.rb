Rails.application.routes.draw do
  resources :operational_systems
  resources :tools
  resources :projects
  resources :languages
  
  get "/users/login" => "login#index"
  post "/users/login" => "login#create"
  get "/users/logout" => "login#logout"
  resources :users

  root :to => "login#index"

	get 'auth/:provider/callback', to: 'omni_auth_login#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'omni_auth_login#destroy'


end
