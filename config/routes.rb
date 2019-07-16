Rails.application.routes.draw do

  resources :books
  resources :notes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "sessions#welcome"
  get 'auth/github/callback', to: 'sessions#create'
  get '/home', to: "sessions#home" , as: 'home'
  devise_for :users

  resources :books do
  	resources :notes, only: [:new, :create , :index]
  end
end
