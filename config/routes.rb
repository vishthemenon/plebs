Rails.application.routes.draw do
  get 'reports/create'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :comments, only: [:create, :update, :destroy]
  resources :lecturers
  resources :subjects
  resources :posts, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :reports, only: [:new, :create]
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
