Rails.application.routes.draw do
  resources :clucks
  devise_for :users
  get '/users/:id/clucks', to: 'clucks#user_clucks', as: 'users_cluck'

  root to: 'clucks#index'
end
