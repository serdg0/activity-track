Rails.application.routes.draw do
  resources :activities do
    resources :entries, shallow: true
  end

  devise_for :users
  root to: 'activities#index'
end
