Rails.application.routes.draw do
  resources :clucks, except: :edit

  resources :users, only: [] do
    resources :clucks, only: :index
  end

  devise_for :users

  root to: 'clucks#index'
end
