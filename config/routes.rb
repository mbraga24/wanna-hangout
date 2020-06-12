Rails.application.routes.draw do
  
  resources :locations
  resources :user_hangouts
  resources :hangouts
  resources :users
end
