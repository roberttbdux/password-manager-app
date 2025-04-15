Rails.application.routes.draw do
  get "dashboard/index"
  #sets up a route for /home/index
  get "home/index"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Authenticated users are redirected to the dashboard

  #covert this to show main page
  authenticated :user do
    root to: 'dashboard#passwords', as: :authenticated_root
  end

  get 'dashboard/passwords', to: 'dashboard#passwords', as: :dashboard_passwords
  get 'dashboard/watchtower', to: 'dashboard#watchtower', as: :dashboard_watchtower
  get 'dashboard/profile', to: 'dashboard#profile', as: :dashboard_profile


  patch 'dashboard/update_profile', to: 'dashboard#update_profile', as: 'dashboard_update_profile'

  #get 'dashboard/profile', to: 'dashboard#profile', as: 'dashboard_profile'
  #patch 'dashboard/profile', to: 'dashboard#update_profile'

  #uncover this to show main page
  #root to: "dashboard#index"
  # Or if you want dashboard to have a separate path:
  get 'dashboard', to: 'dashboard#passwords'
  #uncover this to show main page
  
  resources :passwords, only: [:create]

  resources :passwords, only: [:create, :update, :destroy]


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  #get "up" => "rails/health#show", as: :rails_health_check

  #when user visit the homepage of your app, they will be redirected to the index action of the HomeController.
  #cover this to show main page
  unauthenticated do
    root to: "home#index"
  end

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
