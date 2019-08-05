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
  patch 'reports/:id/mark_as_resolved', to: 'reports#mark_as_resolved', as: 'mark_report_as_resolved'
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
