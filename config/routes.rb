Rails.application.routes.draw do
  get 'likes/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :gossips do 
    resources  :comments
    resources :likes, only: [:create, :destroy]
  end
  resources :cities, only: [:show]
  resources :users, only: [:show, :create, :new]
  resources :sessions, only: [:new, :create, :destroy]

  root 'gossips#index'
  get 'welcome/:first_name', to: 'welcome#show'
  get 'contact', to: 'contacts#show'
  get 'team', to: 'team#show'
end

