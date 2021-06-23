Rails.application.routes.draw do
  root to: 'roulettes#index'

  get '/roulettes/spin', to: 'roulettes#spin'
  get '/players/refill', to: 'players#refill'

  resources :roulettes, only: [:index]
  resources :players

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
