class AfterSignupController < ApplicationController
  include Wicked::Wizard
  steps :complete_profile
  def show
    if current_user.blank?
      user = User.new(params[:user])
      current_user = (user.save) ? user : (redirect_to new_user_registration_path and return)
    end
    
    @user = current_user 
    @profile = Profile.find_by_id(params[:profile]) || Profile.create!(user: current_user)
    case step
    when :complete_profile
      binding.pry 
    end
    render_wizard
  end
end
