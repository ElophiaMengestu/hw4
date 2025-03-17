Rails.application.routes.draw do
  root "places#index"

  get "signup", to: "users#new"
  post "signup", to: "users#create"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :entries
  resources :places
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
end

