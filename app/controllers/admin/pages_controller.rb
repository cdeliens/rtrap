class Admin::PagesController < InheritedResources::Base
    layout "admin/application"

    def new
      @page = Page.new
    end
    
    def index
      @pages_grid = initialize_grid(Page)
    end

end
