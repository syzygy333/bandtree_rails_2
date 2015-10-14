Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :bands do
    resources :releases, only: [:new, :create]
  end

  resources :releases, except: [:new, :create]

  resources :artists

  resources :results, only: [:index]
end
