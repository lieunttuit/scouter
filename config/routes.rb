Rails.application.routes.draw do

  root to: 'home#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords:     'users/passwords',
    sessions:      'users/sessions',
  }

  namespace :admin do
    resources :users, only: [:index]
    get '/evaluation', to: 'users#evaluation'
  end

  resources :users do
    member do
      post :details
      get :details, to: 'users#show'
      get :evaluations
    end
  end

  delete "attachements/:id/purge", to: "attachments#purge", as: "purge_attachment"
  
  resources :evaluations, only: [:index, :new, :create]
end
