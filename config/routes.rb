Rails.application.routes.draw do
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'pages#home' # controller#method => inside the controller, we have the class and method, where we call the view
  # get 'users', to: 'users#index'
  # get 'users/:id', to: 'users#show', as: 'user' # we can use the user_path(user) to get the url
  # get 'users/:user_id/posts', to: 'posts#index'
  # get 'users/:user_id/posts/:id', to: 'posts#show', as: 'post'
end
