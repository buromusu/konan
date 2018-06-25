Rails.application.routes.draw do

  resources :reviews
  get 'youtubes/index'
  get 'search', to: 'reviews#search', as: 'search'
  post 'result', to: 'reviews#result', as: 'result'
  resources :posts
  devise_for :users, :path => 'u'
  get 'pages/show'
  root 'reviews#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :youtubes
end
