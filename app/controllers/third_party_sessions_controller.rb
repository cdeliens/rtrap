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
      if auth
        session[:user_id] = auth.user.id
        session[:username] = auth.user.email
      else
        raise "auth error"
      end
      redirect_to after_signup_path(:complete_profile, profile: auth.user.profile)
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
