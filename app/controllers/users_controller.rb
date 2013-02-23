class UsersController < InheritedResources::Base
  
  before_filter :authenticate_user!, only: [:show, :edit]

  def index
    redirect_to new_user_registration_path
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to(@user, :notice => 'User was successfully updated.')
    else
      render :action => "edit"
    end
  end
end
