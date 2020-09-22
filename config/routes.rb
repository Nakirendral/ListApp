Rails.application.routes.draw do
  resources :lists
  resources :users 
  root 'users#index'
end
