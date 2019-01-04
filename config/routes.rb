Rails.application.routes.draw do
  resources :photographers
  get '/ping', to: 'health_check#health_check'

  root 'home#index'
end
