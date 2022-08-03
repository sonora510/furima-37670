Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
   get 'items/new', to: 'items#new'

  resources :items do
    resources :orders, only: [:index, :nuw, :create]
  end
end