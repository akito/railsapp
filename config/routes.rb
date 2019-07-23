Rails.application.routes.draw do
  root to: 'homes#index'
  get 'homes/index'
  get :login, to: 'sessions#new'
  post :login, to: 'sessions#create'
  delete :logout, to: 'sessions#destroy'

  resources :products
  resource :cart do
    resource :checkout
  end
  resources :order_items
  resources :orders
end
