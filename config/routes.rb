# frozen_string_literal: true

Rails.application.routes.draw do
  root 'tweets#top'
  namespace :following do
    resources :tweets, only: %i[index create]
  end
  resources :tweets, only: %i[top create]
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  resources :tasks
end
