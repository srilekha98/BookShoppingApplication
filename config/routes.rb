Rails.application.routes.draw do
  resources :admins
  resources :books
  resources :transactions
  resources :users
  resources :reviews
  root 'home#index'
  resources :sessions, only: [:new, :create, :destroy]
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :admin_sessions, only: [:new, :create, :destroy]
  get 'admin_login', to: 'admin_sessions#new', as: 'admin_login'
  get 'admin_logout', to: 'admin_sessions#destroy', as: 'admin_logout'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
