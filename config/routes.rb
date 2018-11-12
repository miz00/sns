Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :follows, only: [:create, :destroy]
    resources :tweets, only: [:create, :new, :destroy] do
      resources :favs, only: [:create, :destroy]
      resources :replies, only: [:show, :new, :create, :destroy]
      resources :images, only: [:create]
    end
  end

  get 'users/tweets/timeline', to: 'tweets#timeline'

  namespace :admin do
    resources :users, only: [:index, :show]
  end

  devise_scope :user do
    root to: 'tweets#timeline'
  end

end
