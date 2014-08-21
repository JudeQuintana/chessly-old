Rails.application.routes.draw do


  root "users#index"

  get "signin" => "sessions#new", as: :signin

  post "signin" => "sessions#create"

  get "signout" => "sessions#destroy", as: :signout

  resources :registrations, only: [:new,:create]

  resources :users do
    resources :games do
      resources :notes
    end
  end


end
