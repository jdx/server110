Server110::Application.routes.draw do
  use_doorkeeper

  root to: 'tasks#index'
  match "auth/twitter/callback" => 'omniauth#twitter'

  resources :tasks

  namespace :api do
    resources :tasks
  end
end
