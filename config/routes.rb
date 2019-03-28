Rails.application.routes.draw do
  resources :transactions
  resources :months
  resources :payees
  resources :categories
  resources :groups
  resources :accounts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'transactions#index'
end
