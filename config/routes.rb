Rails.application.routes.draw do
  resources :unit_types
  resources :counselors
  devise_for :users
  root 'pages#index'
  
  # Page routes
  get 'admin', to: "pages#admin"
  get 'welcome', to: "pages#welcome"

  # Standard controller routes
  resources :roles
  resources :merit_badges
end
