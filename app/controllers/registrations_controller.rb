class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in(@user)
      redirect_to after_signup_path(:complete_profile)
    else
      redirect_to :back
    end
  end

  def update
    super
  end
end