Rails.application.routes.draw do
  # get 'users/index'
  # get 'users/edit'
  # get 'books/index'
  # get 'books/new'
  # get 'books/edit'
  root to: 'homes#top'
  get "/about" => "homes#about", as: "about"
  devise_for :users
  resources :users, only: [:index, :edit, :show]
  resources :books, only: [:index, :edit, :show, :create, :update, :delete]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
