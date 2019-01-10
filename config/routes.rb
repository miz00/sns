# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users/search', to: 'users#search'

  resources :users do
    resources :follows, only: %i[create destroy]
    resources :notifications, only: %i[create destroy index]
    resources :notification_favs, only: %i[create destroy]
    resources :notification_replies, only: %i[create destroy]
    resources :tweets, only: %i[create new destroy show] do
      resources :favs, only: %i[create destroy]
      resources :replies, only: %i[show new create destroy]
      resources :images, only: [:create]
    end
  end

  get 'users/tweets/timeline', to: 'tweets#timeline'

  namespace :admin do
    resources :users, only: %i[index show]
  end

  devise_scope :user do
    root to: 'tweets#timeline'
  end
end
