Rails.application.routes.draw do
  resources :users, only: %i[new show create]
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
end
