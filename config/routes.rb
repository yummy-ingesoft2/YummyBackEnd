Rails.application.routes.draw do
  post 'driver_token' => 'driver_token#create'
  
  resources :cities do
    get '/drivers/current' ,  to: 'drivers#current'
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
