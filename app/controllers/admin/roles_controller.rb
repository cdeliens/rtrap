class Admin::RolesController < InheritedResources::Base
    before_filter :verify_admin_authorizations
    layout "admin/application"
    def new
      @role = Role.new
    end
    
    def index
      @roles_grid = initialize_grid(Role)
    end
end
