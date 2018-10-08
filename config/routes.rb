Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  
  # Admin role routes
  get 'admin', to: "home#admin"
  resources :role
 
end
