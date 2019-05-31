Rails.application.routes.draw do
  resources :cities do
    resources :drivers
    resources :clients do 
      resources :reviews
    end
    resources :cooks do
     resources :products do 
      resources :reviews
    end
    end
  end
  
  
  resources :orders
end
