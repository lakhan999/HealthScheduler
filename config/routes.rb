Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "home#index"

  get "search", to: "home#search", as: "search"

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  resources :patients do
    member do
      get :appointment_history
    end
  end

  resources :doctors do
    member do
    get :doctors_appointment_history
    get :patients_history
  end
    resources :appointments, only: [ :new, :create, :edit, :show, :index, :destroy ]
    resources :doctor_availabilities
  end
  resources :appointments
end
