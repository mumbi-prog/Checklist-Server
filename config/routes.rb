Rails.application.routes.draw do
  # resources :users

  post '/login', to: 'sessions#create'
  get '/mysession', to: 'sessions#logged_in'
  delete '/logout', to: 'sessions#destroy'
  resources :checklist_items
  resources :checklists, only: [:index, :show, :create]
  resources :items, only: [:index]
  resources :categories, only: [:index]
  get 'checklists/:date', to: 'checklists#show', as: 'checklist_by_date'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
