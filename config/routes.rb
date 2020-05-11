Rails.application.routes.draw do
  resources :clucks, except: :edit
  devise_for :users

  root to: 'clucks#index'
end
