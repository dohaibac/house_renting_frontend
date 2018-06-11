Rails.application.routes.draw do
  resources :users
  resources :houses
  resources :session
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "houses#index"
  match 'login' => 'session#login', :as => :login, :via => :get
  match 'logout' => 'session#logout', :as => :logout, :via => :get

  match 'login' => 'session#create', :as => :sign_in, :via => :post

  match 'update_house' => 'houses#update_house', :as => :update_house, :via => :get
  match 'delete_house' => 'houses#destroy_house', :as => :delete_house, :via => :get
  match 'search_house' => 'houses#search_house', :as => :search_house, :via => :post

end
