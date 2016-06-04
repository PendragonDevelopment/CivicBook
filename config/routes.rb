Rails.application.routes.draw do
  resources :representative_profiles
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
