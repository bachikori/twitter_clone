# frozen_string_literal: true

Rails.application.routes.draw do
  root 'boards#top'
  get '/boards/following', to: 'boards#following'
  resources :boards, only: %i[index top following create]
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  resources :tasks
end
