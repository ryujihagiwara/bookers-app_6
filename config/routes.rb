Rails.application.routes.draw do

  root 'home#top'
  get 'home/about'

  devise_for :users

  post 'follow/:id' => 'relationships#follow', as: 'follow'
  post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'

  resources :users, only: [:show,:index,:edit,:update]

  get '/users/:id/following' => 'users#following', as: 'following_user'
  get 'users/:id/followers' => 'users#followers', as: 'followers_user'

  resources :books do
  	resource :favorites, only: [:create, :destroy]
  	resources :book_comments, only: [:create, :destroy]
  end



end