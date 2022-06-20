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
    member do
      post :details
    end
  end
  
  get '/users/:id/details', to: 'users#show'

  delete "attachements/:id/purge", to: "attachments#purge", as: "purge_attachment"
  
  resources :evaluations, only: [:index, :new, :create]
end
