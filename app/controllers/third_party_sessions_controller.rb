class ThirdPartySessionsController < ApplicationController
  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']
    if session[:user_id]
      # Means our user is signed in. Add the authorization to the user
      user = User.find(session[:user_id])
      user.add_provider(auth_hash)
      session[:username] = user.email
    else
      # Log him in or sign him up
      auth = Authorization.find_or_create(auth_hash)
      # Create the session
      session[:user_id] = auth.user.id
      session[:username] = auth.user.email
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
