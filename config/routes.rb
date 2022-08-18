Rails.application.routes.draw do
  devise_for :users
  resources :tasklists
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users
  # Defines the root path route ("/")
  root "tasklists#index"
  # root "articles#index"
end
