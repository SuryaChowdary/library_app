Rails.application.routes.draw do
  root 'pages#home'
  get 'about' , to: 'pages#about'
  #resources :books ,only: [:show , :index ,:new, :create, :edit, :update ,:destroy]
  resources :books
  resources :staffs ,only: [:show , :new , :create , :index , :edit, :update , :destroy]
  resources :authors ,only: [:show , :new , :create , :index , :edit, :update , :destroy]
  resources :bookrooms
  resources :locations
end
