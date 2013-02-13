class ThirdPartySessionsController < ApplicationController
  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']
    
    if session[:user_id]
      user = User.find(session[:user_id])
      user.add_provider(auth_hash)
      session[:username] = user.email
    else
      auth = Authorization.find_or_create(auth_hash)
      user = User.find_by_id auth.user.id if auth

      if user && user.profile.complete?
        user = User.find_by_id auth.user.id
        session[:user_id] = user.id
        session[:username] = user.email
        redirect_to profile_path(user.profile)
      else
        redirect_to after_signup_path(:complete_profile, profile: auth.user.profile)
      end  
    
    end
  end

  def failure
    render :text => "Sorry, but you didn't allow access to our app!"
  end
  
  def destroy
    session[:user_id] = nil
    render :text => "You've logged out!"
  end

end
