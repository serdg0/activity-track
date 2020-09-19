Rails.application.routes.draw do
  
  get 'entries/new'
  get 'entries/create'
  get 'entries/index'
  get 'activities/new'
  get 'activities/create'
  devise_for :users
  root to: 'entries#index'
end
