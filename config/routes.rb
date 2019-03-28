Rails.application.routes.draw do
  get 'sessions/new'

  resources :users, only: [:index, :new, :create, :show]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
end
