Rails.application.routes.draw do
  devise_for :users
  root to: "books#index"
  resources :books, only: [:index]
  resources :books, only: :show do

  resources :sales, only: [:show, :new, :create]

 end
 resources :sales, only: [:index]
 	get "styleguide", to: "styleguide#index"
end
