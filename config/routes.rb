Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  devise_for :users
  resources :tasklists
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users
  # Defines the root path route ("/")
  root "home#index"
  # root "articles#index"
end
end
