Rails.application.routes.draw do
  resources :cities do
    resources :clients
    resources :cooks do
     resources :products
    end
  end
  resources :drivers
  resources :reviews, only: [:create]
  resources :orders, only: [:create]
end
