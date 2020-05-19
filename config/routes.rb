Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :lists do
    resources :entries
  end

  # Sets the default root to /lists
  root "lists#index"
end