Rails.application.routes.draw do
  devise_for :users
  resources :courses do
    resources :lessons
  end
  resources :users, only: [:index, :edit, :show, :update]
  root 'courses#welcome' # root 'courses#index'
  get 'courses/index'
  get 'welcome', to: 'courses#welcome'
  get 'activity', to: 'courses#activity'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
