class Admin::DashboardsController < ApplicationController
  layout "admin/application"
  before_filter :authenticate_user!
  before_filter :verify_admin_authorizations

end
