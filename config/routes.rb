Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  resources :accounts, only: [:show] do
    resource :follow, only: [:create, :destroy]
    resources :followings, only: [:index]
    resources :followers, only: [:index]
  end

  resource :timeline, only: [:show]
  resource :profile, only: [:show, :edit, :update]

  resources :tweets, only: [:show, :new, :create, :edit, :update, :destroy] do
    resource :like, only: [:create]
  end
end
