Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/rides', to: 'rides#index' 
  get '/rides/:id', to: 'rides#show'
  get '/passengers', to: 'passenger#index'
end
