Rails.application.routes.draw do
  resources :scenarios
  resources :notes
  resources :games
  resources :characters
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
