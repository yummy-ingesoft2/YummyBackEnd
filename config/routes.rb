Rails.application.routes.draw do
 
  post 'cook_token' => 'cook_token#create'
  post 'client_token' => 'client_token#create'
  post 'driver_token' => 'driver_token#create'
  post 'admin_token' => 'admin_token#create'
  get 'admins/current' => 'admins#current'
  get 'clients/all' => 'clients#all'
  get 'cooks/all' => 'cooks#all'
  get 'drivers/all' => 'drivers#all'
  get 'products/all' => 'products#all'
  get 'reviews/all' => 'reviews#all'
  get 'orders/all' => 'orders#all'
  get 'orderproducts/all' => 'orderproducts#all'
  resources :admins
  resources :cities do
    get 'drivers/current' => 'drivers#current'
    resources :drivers
    get 'clients/current' => 'clients#current'
    resources :clients do
      resources :orders do 
        resources :orderproducts
      end
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
