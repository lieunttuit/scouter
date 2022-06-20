Rails.application.routes.draw do
  root to: 'users#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :users
    get '/evaluation', to: 'users#evaluation'
  end

  

  resources :users do
    post :details
  end
  get '/users/:id/details', to: 'users#show'
  
  resources :evaluations, only: [:index, :new, :create]
end
