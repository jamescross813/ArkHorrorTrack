Rails.application.routes.draw do
  resources :character_bases
  resources :users
  resources :scenarios
  resources :notes
  resources :games
  resources :characters
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
