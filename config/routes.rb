Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/login', controller: :users, action: :login
  delete '/logout', controller: :users, action: :logout
  root 'users#new'
  get 'welcomes/index'
  resources :teachers
  resources :students do
    collection do
      get "generate_excel"
    end
  end
  resources :standards
  resources :classrooms
  resources :addresses
  resources :attendances

  namespace :api do
    namespace :v1 do
      resources :students
      resources :districts
    end
  end

end
