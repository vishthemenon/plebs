Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  resources :lecturers
  resources :subjects
  post 'subjects/:id/add_user', to: 'subjects#add_user', as: 'add_user_to_subject'
  post 'subjects/:id/del_user', to: 'subjects#del_user', as: 'del_user_from_subject'
  resources :posts, only: [:show, :new, :create, :edit, :update, :destroy]
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
