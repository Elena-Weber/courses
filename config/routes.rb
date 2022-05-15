Rails.application.routes.draw do
  root "courses#index"
  get '/', to: 'courses#index'
  resources :courses
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
