Rails.application.routes.draw do
  get 'home/index'

  devise_for :users
  resources :articles
  root 'home#index'
end
