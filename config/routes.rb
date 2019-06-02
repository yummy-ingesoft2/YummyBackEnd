Rails.application.routes.draw do

  post 'cook_token' => 'cook_token#create'
  post 'client_token' => 'client_token#create'
  post 'driver_token' => 'driver_token#create'
  resources :cities do
    get 'drivers/current' => 'drivers#current'
    resources :drivers
    get 'clients/current' => 'clients#current'
    resources :clients do 
      resources :reviews
    end
    get 'cooks/current' => 'cooks#current'
    resources :cooks do
     resources :products do 
      resources :reviews
    end
    end
  end
  
  
  resources :orders
end
