Rails.application.routes.draw do
  resources :cities do
    resources :clients
    resources :cooks do
     resources :products
    end
  end
  resources :drivers
end
