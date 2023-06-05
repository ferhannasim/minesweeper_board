Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "boards#new"
  get '/home' => 'boards#home'
  resources :boards
end
