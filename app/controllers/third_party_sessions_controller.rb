class ThirdPartySessionsController < ApplicationController
  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']
    auth = Authorization.find_or_create(auth_hash)
    session[:user_id] = auth.user.id
    if auth.user.profile.complete?
      sign_in(auth.user)
      redirect_to profile_path(auth.user.profile)
    else
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
