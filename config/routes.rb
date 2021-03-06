Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/rides', to: 'rides#index' 
  get '/rides/new', to: 'rides#new'
  post '/rides', to: 'rides#create'
  get '/rides/:id', to: 'rides#show'
  get '/passengers', to: 'passengers#index'
  get '/passengers/:id', to: 'passengers#show'
  get '/rides/:id/passengers', to: 'ride_passengers#index'
  patch '/rides/:id', to: 'rides#update'
  get '/rides/:id/edit', to: 'rides#edit'
  get '/rides/:id/passengers/new', to: 'ride_passengers#new'
  post '/rides/:id/passengers', to: 'ride_passengers#create'
  get '/passengers/:id/edit', to: 'passengers#edit'
  patch '/passengers/:id', to: 'passengers#update'
  delete '/rides/:id', to: 'rides#destroy'
  delete '/passengers/:id', to: 'passengers#destroy'
end
