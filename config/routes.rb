Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  resources :blogposts

  resources :users, only: [:create]
  get '/register', to: 'users#new'

  get '/sign_in', to: 'sessions#new'
  get '/sign_out', to: 'sessions#destroy'

  #This will be for when we receive a post request for CREATING A NEW SESSION!
  resource :sessions, only: [:create]

  root 'home#index'
end
