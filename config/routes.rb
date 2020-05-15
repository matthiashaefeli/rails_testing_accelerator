Rails.application.routes.draw do
  resources :clucks, except: :edit
  resources :reclucks, only: %i[create destroy]

  resources :users, only: [] do
    resources :clucks, only: :index
  end

  devise_for :users

  root to: 'clucks#index'
end
