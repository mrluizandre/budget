Rails.application.routes.draw do

  resources :goals
  resources :budgets do
    member do
      get :set_current
    end
  end
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  resources :scheduled_transactions do
    member do
      get :enter_now
    end
    collection do
      get :new_by_installments
      post :create_by_installments
    end
  end

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
    collection do
      get :mobile
    end
    member do
      get :transactions
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#index'
end
