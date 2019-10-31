Rails.application.routes.draw do
  
  resources :gossips
  resources :team, only: [:index]
  resources :contact, only: [:index]
  resources :home, only: [:index]
  resources :authors
  resources :city, only: [:show]
  resources :comment, only: [:show]
  resources :user
  resources :sessions


end
