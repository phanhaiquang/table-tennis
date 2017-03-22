Rails.application.routes.draw do
  resources :cup_players
  resources :players
  resources :matches
  resources :cups

  root 'results#index'
end
