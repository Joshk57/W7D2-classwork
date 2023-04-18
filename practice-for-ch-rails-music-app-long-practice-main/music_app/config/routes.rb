Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "session#index"
  resources :users, only: [:new, :create, :show]
  resources :session, only: [:new, :create, :destroy]
end
