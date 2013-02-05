Rtrap::Application.routes.draw do

  get "chats/room"

  get   '/login', :to => 'third_party_sessions#new', :as => :login
  get   '/logout', :to => 'third_party_sessions#destroy', :as => :logout
  match '/auth/:provider/callback', :to => 'third_party_sessions#create'
  match '/auth/failure', :to => 'sessions#failure'

  devise_for :users
  resources :users

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config

  get  '/chatroom' => 'chats#room', :as => :chat

  root :to    => "static_pages#home"

end
