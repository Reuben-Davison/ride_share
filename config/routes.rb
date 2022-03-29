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
end
