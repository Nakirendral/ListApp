Rails.application.routes.draw do
  resources :users
  resources :lists do
    resources :entries
  end
  root 'users#index'
end