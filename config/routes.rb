Rails.application.routes.draw do
  resources :tasks do 
	  resources :todos
  end
  get 'my-todo-list', to: 'todos#my_todo_list'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tasks#index'
end
