Rails.application.routes.draw do
  resources :activities
  get 'entries/new'
  get 'entries/create'
  get 'entries/index'
  devise_for :users
  root to: 'entries#index'
end
