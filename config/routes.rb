Rails.application.routes.draw do
  authenticated :user, ->(user) { user.admin? || user.user? } do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  end
  resources :attacks
  resources :attachmenters
  get 'users/profile'
  resources :posts do 
    resources :comments 
  end

  resources :projects do
  resources :attacks
          end
  root 'pages#home'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',

    
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/u/:id', to: 'users#profile', as: 'user'
  # Defines the root path route ("/")
  # root "articles#index"
end
