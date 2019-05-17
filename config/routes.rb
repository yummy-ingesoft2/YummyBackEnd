Rails.application.routes.draw do
  resources :cities do
    resources :clients
    resources :cooks
  end
end
