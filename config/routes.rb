Rails.application.routes.draw do
  get '/routes', to: 'location_data#index'
  post '/routes', to: 'location_data#create'
end
