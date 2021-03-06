Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  resources :users, only: [:show, :create, :update, :edit] do
    member do
      get :products
    end
  end
  
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
