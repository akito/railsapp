Rails.application.routes.draw do
  root to: 'homes#index'
  get 'homes/index'
end
