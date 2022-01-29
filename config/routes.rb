Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'pages#home' # controller#method => inside the controller, we have the class and method, where we call the view
  # get 'users', to: 'users#index'
  # get 'users/:id', to: 'users#show', as: 'user' # we can use the user_path(user) to get the url
  resources :users do 
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments
    end
  end
end
