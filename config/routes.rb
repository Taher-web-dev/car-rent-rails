# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    resources :users, only: %i[index create]
    resources :cars, only: %i[index create destroy update]
    resources :reservations, only: %i[index create destroy update]
    resources :current_infos, only: [:index]
    resources :likes, only: %i[index create]
  end
end
