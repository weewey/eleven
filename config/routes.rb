Rails.application.routes.draw do
  resources :photos
  get '/ping', to: 'health_check#health_check'

  devise_for :users
  root 'home#index'
end
