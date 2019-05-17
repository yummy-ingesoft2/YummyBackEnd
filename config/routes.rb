Rails.application.routes.draw do
  resources :cities do
    resources :clients
  end
end
