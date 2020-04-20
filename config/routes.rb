Rails.application.routes.draw do
  resources :clucks
  devise_for :users

  root to: 'clucks#index'
end
