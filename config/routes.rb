Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace :api do 
    resources :users , only:[:index,:create]
    resources :cars , only:[:index]
    resources :current_infos, only:[:index]
  end
end
