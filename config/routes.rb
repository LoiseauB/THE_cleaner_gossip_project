Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :gossips do 
    resources  :comments
    resources :likes, only: [:create, :destroy]
  end
  resources :cities, only: [:show]
  resources :users, only: [:show, :create, :new, :update]
  resources :sessions, only: [:new, :create, :destroy]
  resources :contacts, only: [:show]
  resources :team, only: [:show]
  resources :welcome, only: [:show]

  root 'gossips#index'
end

