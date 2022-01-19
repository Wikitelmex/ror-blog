Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'pages#home' # controller#method => inside the controller, we have the class and method, where we call the view
  # Defines the root path route ("/")
  # root "articles#index"
end
