Rails.application.routes.draw do
  root "homes#about"

  devise_for :users,
            path: "users", 
            controllers: {
            registrations: "users/registrations"
            }

  devise_for :admins,
            path: "admin",
            controllers: {
              sessions: "admins/sessions"
            }
  namespace :admin do
    root "users#index"
    resources :users, only: [:index, :show, :edit, :update]
    resources :parks, only: [:index, :show, :edit, :update, :destroy]
    resources :park_comments, only: [:destroy]
    resources :prefectures, only: [:index, :create, :edit, :update]
    resources :equipments, only: [:index, :create, :edit, :update]
    resources :playgrounds, only: [:index, :create, :edit, :update]
    resources :communities
  end

  resources :users, only: [:show, :edit, :update] do
    collection do
      get "my_page"
      get "information"
      get "information/edit", action: :edit
      get "unsubscribe"
      patch "withdraw"
    end
    member do
      get :favorites
    end
  end

  resources :parks do
    resources :park_comments, only: [:create, :edit, :update, :destroy]
    resource :favorite, only: [:create, :destroy]
  end

  resources :communities do
    resources :community_comments, only: [:create, :edit, :update, :destroy]
  end

  resources :favorites, only: [:index]

  resources :communities, only: [:index, :show] do
    resource :community_membership, only: [:create, :destroy]
    resources :community_comments, only: [:create, :edit, :update, :destroy]
  end

  get "search", to: "searches#index"

  
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
