Rails.application.routes.draw do
  get '/images/:id', to: 'image#show'
  get '/images', to: 'image#all'
  post '/images', to: 'image#save'
end
