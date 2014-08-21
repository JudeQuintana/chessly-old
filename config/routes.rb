Rails.application.routes.draw do


  root "users#index"

  get "signin" => "sessions#new", as: :signin

  post "signin" => "sessions#create"

  get "signout" => "sessions#destroy", as: :signout

  resources :registrations, only: [:new,:create]
  # resource :session, only: [:new,:create,:destroy]

  resources :users
  # do
  #   resources :games
  # end


end
