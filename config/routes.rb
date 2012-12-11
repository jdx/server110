Server110::Application.routes.draw do
  devise_for :users

  use_doorkeeper

  root to: 'days#index'

  resources :tasks do
    member do
      post 'review'
    end
  end
  resources :days

  namespace :api do
    resources :days
    resources :tasks
  end
end
