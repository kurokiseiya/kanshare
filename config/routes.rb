Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  root to: "homes#top"
  resources :books do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  
  resources :users, only: [:show, :edit, :update, :index]
  
  resources :dos do
    resources :do_comments, only: [:create, :destroy]
  end
end
