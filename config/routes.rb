Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  root "welcome#index"

  resources :users, only: [:show, :index, :new, :create, :update, :edit] do
    resources :dashboard, only: [:index]  
    resources :journals, only: [:index, :show, :new, :create, :destroy]
  end
  
  get "/login", to: "users#login_form"
  post "/login", to: "users#login"

  get "/about", to: "about#index"
  
  resources :emergency_services, only: [:index, :show]

  get "/auth/:provider/callback", to: "sessions#omniauth"
end
