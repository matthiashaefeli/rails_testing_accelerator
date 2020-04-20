Rails.application.routes.draw do
  resources :clucks
  devise_for :users

  devise_scope :user do
    root to: 'devise/registrations#new'
  end
end
