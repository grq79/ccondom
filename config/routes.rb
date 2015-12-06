Ccondom::Application.routes.draw do
  resources :subscribers

  devise_for :users, controllers: { registrations: "users/registrations" }

  root 'static#index'
  get '/about', to: 'static#about', as: "about"
end
