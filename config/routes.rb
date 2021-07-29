Rails.application.routes.draw do
  resources :tokens
  resources :meetings

  root 'join#index'
end
