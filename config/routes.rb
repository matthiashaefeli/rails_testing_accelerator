Rails.application.routes.draw do
  resources :reclucks, only: [:create, :destroy]
  resources :clucks
  devise_for :users
  get '/users/:id/clucks', to: 'clucks#user_clucks', as: 'users_cluck'

  root to: 'clucks#index'
end
