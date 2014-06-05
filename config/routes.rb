Rails.application.routes.draw do
  root :to => 'pages#index'
  resources :brands, only: [:show]
  resources :posts, only: [:show]

end
