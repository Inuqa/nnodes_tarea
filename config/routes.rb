Rails.application.routes.draw do
  root to: 'roulettes#index'
  resources :roulettes, only: [:index]
  resources :players

  get '/roulettes/spin', to: 'roulettes#spin'
  get '/players/refill', to: 'players#refill'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
