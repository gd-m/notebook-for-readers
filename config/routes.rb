Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "sessions#welcome"
  get '/home', to: "sessions#home" , as: 'home'
  devise_for :users
end
