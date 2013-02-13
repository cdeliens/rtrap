class AfterSignupController < ApplicationController
  include Wicked::Wizard
  steps :complete_profile
  def show
    @user = current_user
    @profile = Profile.find_by_id(params[:profile])
    case step
    when :complete_profile
      binding.pry 
    end
    render_wizard
  end
end
