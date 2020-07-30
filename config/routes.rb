Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'welcomes/index'
  root 'users#new'
  post '/login', controller: :users, action: :login
  delete '/logout', controller: :users, action: :logout
end
