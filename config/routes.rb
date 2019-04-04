Rails.application.routes.draw do
  
  devise_for :users
  get 'static_pages/start' => 'static_pages_#start'
  get 'static_pages/console' => 'static_pages_#console'
  get 'static_pages/help' => 'static_pages_#help'
  get 'static_pages/about' => 'static_pages_#about'
  get 'static_pages/user_home' => 'static_pages_#user_home'

  root 'users#login_form'

  resources :keijibans
  resources :account_activations, only: [:edit]
  
  post "likes/:todo_id/create" => "likes#create"
  
  post "likes/:todo_id/destroy" => "likes#destroy"

  
  post '/users/todos/:id/update' =>'todos#todo_update'
  
  get '/users/todos/:id/destroy' => 'todos#todo_destroy'
  
  get '/users/todos/:id/edit' => 'todos#todo_edit'
  
  get '/users/todos/:id' => 'todos#todo_detail'
  
  post '/users/todos/create' => 'todos#todo_create'
  
  post '/users/todos/create_universal' => 'todos#todo_create_universal'
  
  get '/users/:id' => 'users#todolist'
  
  post '/login' => 'users#login'
  
  post '/create' => 'users#create'
  
  get '/logout' => 'users#logout'
  
  get '/login_form' => 'users#login_form'
  
  get '/signup' => 'users#signup'

end
