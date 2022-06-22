Rails.application.routes.draw do

  root to: 'home#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords:     'users/passwords',
    sessions:      'users/sessions',
  }

  namespace :admin do
    resources :users do
      collection do
        get :evaluation
        get :scouter
      end
    end
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
