Rtrap::Application.routes.draw do

  get   '/login', :to => 'third_party_sessions#new', :as => :login
  get   '/logout', :to => 'third_party_sessions#destroy', :as => :logout
  match '/auth/:provider/callback', :to => 'third_party_sessions#create'
  match '/auth/failure', :to => 'sessions#failure'

  ActiveAdmin.routes(self)
  devise_for :admin_users, ActiveAdmin::Devise.config
  
  root :to    => "third_party_sessions#new"

end
