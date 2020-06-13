Rails.application.routes.draw do
  root to: "pages#home", as: "/home"
  get "/login", to: "pages#login"

  resources :locations
  resources :user_hangouts
  resources :hangouts
  resources :users
  get "/register", to: "users#new"
end
