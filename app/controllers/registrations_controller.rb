class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    super
  end

  def update
    super
  end

  protected

  def after_sign_in_path_for(resource)
    after_signup_path(:complete_profile, user_id: current_user.id )
  end

end