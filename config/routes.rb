Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'sessions/new'
  #get 'users/new'

  #static pages routes
  root 'static_pages#home'
  get '/help',  to: 'static_pages#help'
  get '/about',to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  
  #sessions routes
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  #users routes
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  resources :users
  
end
