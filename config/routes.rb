Rails.application.routes.draw do
  resources :lists
  resources :users 
  resources :entries
  root 'users#index'
end
