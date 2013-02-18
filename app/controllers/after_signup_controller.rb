class AfterSignupController < ApplicationController
  include Wicked::Wizard
  steps :complete_profile
  def show
    current_user = User.find(params[:user_id]) if params[:user_id] && current_user.blank?

    @profile = Profile.find_by_id(params[:profile]) || Profile.create!(user: current_user)
    case step
    when :complete_profile
    end
    render_wizard
  end
end
