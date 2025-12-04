Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  
  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  
  # Defines the root path route ("/")
  # root "posts#index"
  root 'homes#top'

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy'

  get 'users/account', to: 'users#account'
  get 'users/account/edit', to: 'users#account_edit'
  patch 'users/account', to: 'users#account_update'
  
  get 'users/profile', to: 'users#profile'
  get 'users/profile/edit', to: 'users#profile_edit'
  patch 'users/profile', to: 'users#profile_update'

  get 'rooms/own', to: 'rooms#own'

  resources :users
  resources :rooms
  resources :reservations do
    collection do
      post :confirm
    end
  end
end
