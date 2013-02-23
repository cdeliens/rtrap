class Admin::UsersController < InheritedResources::Base
    layout "admin/application"
    def index
      @users_grid = initialize_grid(User)
    end
end
