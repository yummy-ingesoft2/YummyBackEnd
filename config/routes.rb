Rails.application.routes.draw do
  resources :cities do
    resources :clients do
     resources :products
    end
    resources :cooks
  end
  resources :drivers
end
