Rails.application.routes.draw do
  get 'chats/show'
  devise_for :users

  root :to =>"homes#top"
  get "home/about"=>"homes#about"

  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:index,:show,:edit,:update] do
    get "search" => "users#search"
    resource :relationships, only: [:create, :destroy]
  	get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
  end
  
  get 'tagsearches/search', to: 'tagsearches#search'

  get '/search', to: 'searches#search'
  
  get 'chat/:id', to: 'chats#show', as: 'chat'
  resources :chats, only: [:create]
  
  resources :groups, only: [:new, :index, :show, :create, :edit, :update] do
   resource :group_users, only: [:create, :destroy]
    get "new/mail" => "groups#new_mail"
    get "send/mail" => "groups#send_mail"
  end
end
