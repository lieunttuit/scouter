Rails.application.routes.draw do
  root to: 'users#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users
  end

  resources :users do
    post :details
  end
  
  resources :evaluations, only: [:index, :new, :create, :destroy]
end
