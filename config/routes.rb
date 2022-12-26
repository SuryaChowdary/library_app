Rails.application.routes.draw do
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :books
  resources :staffs 
  resources :authors 
  resources :companies
  resources :locations
  resources :libraries
end
