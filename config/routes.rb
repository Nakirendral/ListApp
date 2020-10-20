Rails.application.routes.draw do
  resources :users
  resources :lists do
    resources :entries
  end
  resources :entries
  root 'users#index'
end