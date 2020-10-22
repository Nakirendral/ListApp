Rails.application.routes.draw do
  resources :lists do
    resources :entries
  end
  resources :users 
  root 'users#index'
end
