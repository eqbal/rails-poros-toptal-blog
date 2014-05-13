ToptalTask::Application.routes.draw do


  root "entries#index"

  resources :entries
  resources :statistics, only: :index

  devise_for :users

  namespace :admin do
    root "base#index"
    resources :users
  end

end
