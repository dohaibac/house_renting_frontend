Rails.application.routes.draw do
  resources :contracts
  resources :houses
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "houses#index"
end
