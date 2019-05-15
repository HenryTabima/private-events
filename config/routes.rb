Rails.application.routes.draw do
  resources :events, only: %i[new create index show]
  resources :users, only: %i[new show create]
  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
