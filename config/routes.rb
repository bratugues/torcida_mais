Rails.application.routes.draw do
  devise_for :users
  resources :events, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
    collection do
      get :my
    end
    
    resources :attendances, only: [:create]
    resources :reviews, only: [:new, :create, :index]
    resources :chats, only: [:index]
    resources :messages, only: [:create]
  end

  resources :attendances, only: [:index, :destroy]
  resources :matches, only: [:index, :destroy]

  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
