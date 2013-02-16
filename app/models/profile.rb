class Profile < ActiveRecord::Base
  attr_accessible :email, :full_name, :gender, :image, :location, :user, :address, :user_attributes
  belongs_to :user

  def complete?
    status = true
    status = false if  self.email.blank?  || (/@missing.com/.match(self.email))
    status = false  if self.address.blank?
    status = false  if self.gender.blank?
    status
  end
  
end
