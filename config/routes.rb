Rails.application.routes.draw do
  resources :cup_players
  resources :players
  resources :matches
  resources :cups
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
