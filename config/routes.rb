Rails.application.routes.draw do
  root to: "pages#home", as: "/home"
  get "/pages", to: "pages#about", as: "/about"
  
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :locations
  resources :user_hangouts
  resources :hangouts
  get "users/new_form", to: "users#new_form", :as => :new_form
  resources :users, except: [:new]
end
