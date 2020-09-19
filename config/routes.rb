Rails.application.routes.draw do
  resources :activities
  resources :entries

  devise_for :users
  root to: 'activities#index'
end
