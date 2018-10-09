Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  
  # Admin role routes
  get 'admin', to: "pages#admin"
  resources :roles
 
end
