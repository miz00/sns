Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :follows, only: [:create, :destroy]
    resources :tweets, except: [:edit, :update] do
      resources :fav, only: [:update, :create]
      resources :replies, only: [:show, :new, :create, :destroy]
      resources :images
    end
  end

  namespace :admin do
    resources :users, only: [:index, :show]
  end
end
