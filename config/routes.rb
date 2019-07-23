Rails.application.routes.draw do
  resources :lecturers
  resources :subjects
  resources :posts, only: [:show, :new, :create, :edit, :update, :destroy]
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
