Rails.application.routes.draw do
  root 'upcoming_lessons#index'

  get 'upcoming_lessons', to: 'upcoming_lessons#index'
  get 'week_six', to: 'voting#index'
  get 'contact', to: 'contact#index'
  get 'about', to: 'about#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  resources :users, only: [:new, :create]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :suggested_topics, only: [:index, :create]
      resources :user_votes, only: [:create]
    end
  end
end
