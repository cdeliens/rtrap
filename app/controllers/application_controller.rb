class ApplicationController < ActionController::Base
  protect_from_forgery


  def verify_admin_authorizations
    authorize! :manage, :admin
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end  

end
