Rails.application.routes.draw do
  resources :runners
  resources :races

  get 'photos/search', :to => 'photos#search'
  resources :photos

  devise_for :photographers
  resources :photographers
  get '/ping', to: 'health_check#health_check'
  mount Sidekiq::Web => '/sidekiq'

  root 'home#index'
end
