Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :bands do
    resources :releases, only: [:index, :new, :create]
  end

  resources :releases, only: [:show, :edit, :update, :destroy]
end
