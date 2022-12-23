Rails.application.routes.draw do
  root 'pages#home'
  get 'about' , to: 'pages#about'
  #resources :books ,only: [:show , :index ,:new, :create, :edit, :update ,:destroy]
  resources :books
  resources :staffs 
  resources :authors 
  resources :companies
  resources :locations
end
