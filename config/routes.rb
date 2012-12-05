Server110::Application.routes.draw do
  use_doorkeeper

  root to: 'days#index'
  match "auth/twitter/callback" => 'omniauth#twitter'

  resources :tasks do
    member do
      post 'review'
    end
  end
  resources :days

  namespace :api do
    resources :tasks
  end
end
