# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tweets#top'
  namespace :following do
    resources :tweets, only: %i[index create]
  end
  resources :tweets, only: %i[top create show] do
    resources :comments, only: %i[create]
    resource :favorites, only: %i[create destroy]
    resource :retweets, only: %i[create destroy]
    resource :bookmarks, only: %i[create destroy]
  end
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  resources :users, shallow: true do
    resources :comments
    resources :favorites
    resources :retweets
    resource :relationships, only: %i[create destroy]
  end
  resources :bookmarks, only: %i[index]
  resources :tasks
end
