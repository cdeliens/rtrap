class Admin::RolesController < InheritedResources::Base
    layout "admin/application"
    def new
      @role = Role.new
    end
    
    def index
      @roles_grid = initialize_grid(Role)
    end
end
