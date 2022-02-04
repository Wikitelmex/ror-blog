Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'pages#home' # controller#method => inside the controller, we have the class and method, where we call the view
  # get 'users', to: 'users#index'
  # get 'users/:id', to: 'users#show', as: 'user' # we can use the user_path(user) to get the url
  resources :users do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      get '/likes', to: 'likes#create', as: "create_like"
      resources :comments, only: [:index, :new, :create]
    end
  end
  delete '/comments', to: 'comments#destroy', as: "destroy_comment"

  # API routes
  namespace :api do    
    resources :posts, only: [:index, :show, :create, :update, :destroy] do
      resources :comments, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
