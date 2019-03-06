Rails.application.routes.draw do
  resources :runners
  resources :races
  resources :photos
  resources :photographers
  get '/ping', to: 'health_check#health_check'
  mount Sidekiq::Web => '/sidekiq'

  root 'home#index'
end
