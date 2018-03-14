Rails.application.routes.draw do
  post "/login", to: 'auth#login'
  post "/current_user", to: "auth#current"
  
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
