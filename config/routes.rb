Rails.application.routes.draw do
  root 'upcoming_lessons#index'

  get 'upcoming_lessons', to: 'upcoming_lessons#index'
  get 'week_six', to: 'voting#index'
  get 'contact', to: 'contact#index'
  get 'about', to: 'about#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'suggested_topics', to: 'lesson_topics#index'
    end
  end
end
