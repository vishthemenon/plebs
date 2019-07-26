Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :comments, only: [:new, :create, :edit, :update, :destroy]
  get 'comments/destroy'
  resources :lecturers
  resources :subjects
  resources :posts, only: [:show, :new, :create, :edit, :update, :destroy]
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
