class Admin::UsersController < InheritedResources::Base
    layout "admin/application"
    def new
      @user = User.new
    end

    def index
      @users_grid = initialize_grid(User)
    end

    def edit
      @user = User.find params[:id]
    end
    def show
      @user = User.find params[:id]
    end
    def update
      @user = User.find params[:id]
      @user.update_attributes params[:user]
      redirect_to admin_users_path
    end
end
