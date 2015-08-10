Rails.application.routes.draw do
  root 'homes#index'
  devise_for :users

  resources :bands do
    resources :albums
  end
end
