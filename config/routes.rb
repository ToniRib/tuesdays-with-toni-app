Rails.application.routes.draw do
  root 'upcoming_lessons#index'

  get 'upcoming_lessons', to: 'upcoming_lessons#index'
  get 'week_six', to: 'voting#index'
  get 'contact', to: 'contact#index'
  get 'about', to: 'about#index'
end
