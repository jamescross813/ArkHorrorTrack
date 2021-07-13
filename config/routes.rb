Rails.application.routes.draw do
  root to: 'application#homepage'
  
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new' 
  post '/login' => 'sessions#create' 
  post '/logout' => 'sessions#destroy'
  
  get '/auth/google_oauth2/callback' => 'sessions#omniauth' 

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
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
