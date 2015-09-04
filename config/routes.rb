Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :bands do
    resources :releases, only: [:new, :create]
  end

  resources :releases, only: [:index, :show, :edit, :update, :destroy]

  resources :artists
end
