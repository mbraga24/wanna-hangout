Rails.application.routes.draw do
  root to: "pages#home", as: "/home"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :locations
  resources :user_hangouts
  resources :hangouts
  resources :users
  get "/register", to: "users#new", as: :register
end
