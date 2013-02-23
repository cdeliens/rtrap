class Admin::PagesController < InheritedResources::Base
    layout "admin/application"
    def index
      @pages_grid = initialize_grid(Page)
    end
end
