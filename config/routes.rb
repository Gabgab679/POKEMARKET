Rails.application.routes.draw do
  get 'sales/create'
  get 'sales/index'
  get 'sales/update'
  get 'cards/index'
  get 'cards/:id', to: 'cards#show'
  get 'cards/new'
  get 'cards/create'
  devise_for :users
  root to: "pages#home"

  resources :users, only: [:show, :edit, :update]
  # resources :lists do
  #   resources :bookmarks, only: [:new, :create]
  # end
  # resources :bookmarks, only: [:destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
