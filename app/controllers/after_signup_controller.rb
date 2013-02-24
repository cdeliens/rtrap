class AfterSignupController < ApplicationController
  
  before_filter :set_current_user

  include Wicked::Wizard
  steps :complete_profile

  def show
    @profile = Profile.find_by_id(params[:profile]) || Profile.create!(user: @current_user)
    case step
    when :complete_profile
    end
    render_wizard
  end

  private

  def set_current_user
    if params[:user_id] && current_user.blank?
      @current_user = User.find(params[:user_id]) 
    elsif session[:user_id]
      @current_user = User.find(session[:user_id])
    end
    sign_in(@current_user) if @current_user
  end
end
