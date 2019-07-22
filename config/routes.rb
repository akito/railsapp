Rails.application.routes.draw do
  resources :products
  root to: 'homes#index'
  get 'homes/index'
  get :login, to: 'sessions#new'
  post :login, to: 'sessions#create'
  delete :logout, to: 'sessions#destroy'
end
