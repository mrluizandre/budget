Rails.application.routes.draw do
  get 'pages/index'
  resources :transfers
  resources :transactions
  resources :months
  resources :payees
  resources :categories do
  	member do
  		post :budget
  	end
  end
  resources :groups
  resources :accounts do
    member do
      get :transactions
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#index'
end
