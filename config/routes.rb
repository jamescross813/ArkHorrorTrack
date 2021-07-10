Rails.application.routes.draw do
  root to: 'application#homepage'
  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new' 
  post '/login' => 'sessions#create' 
  post '/logout' => 'sessions#destroy'
  
  get '/auth/twitter/callback' => 'sessions#create_twitter' 

  resources :scenarios
  resources :characters
  resources :users
  resources :notes
  resources :character_bases, only:[:show, :index]
  
  resources :users do
    resources :games
  end
  resources :games do 
    resources :characters
  end
  resources :games do 
    resources :scenarios
  end  

  resources :scenarios do 
    resources :notes
  end
  
  match '/auth/:provider/callback', to: 'auth#callback', via: [:get, :post]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
