Rtrap::Application.routes.draw do
  
  namespace :admin do resources :pages end

  resources :after_signup
  resources :profiles
  resources :pages
  resources :roles

  
  get "chats/room"
  get   '/login', :to => 'third_party_sessions#new', :as => :login
  get   '/logout', :to => 'third_party_sessions#destroy', :as => :logout
  match '/auth/:provider/callback', :to => 'third_party_sessions#create'
  match '/auth/failure', :to => 'sessions#failure'
  match 'signout', to: 'third_party_sessions#destroy', as: 'signout'
  

  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users, only: [:index, :show, :edit, :update]
  devise_for :admin_users

  get  '/chatroom' => 'chats#room', :as => :chat

  resources :static_pages, only: [] do
    collection do
      get :home
    end
  end
  namespace :admin do
    resources :dashboards
    resources :pages
    resources :roles
    resources :users
  end

  root :to    => "static_pages#home"

end
