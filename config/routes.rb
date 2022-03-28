# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do
    resources :users, only: [:index]
    resources :cars, only: [:index] do
      resources :reservations, only: %i[index create, destroy, update]
    end
    resources :current_infos, only: [:index]
  end
end
