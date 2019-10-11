Rails.application.routes.draw do
  devise_for :users
  get 'dashboard', to: 'dashboard#index'
  root 'dashboard#index'

  resources :companies
  resources :events
  resources :spaces
end
