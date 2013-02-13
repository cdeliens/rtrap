class Profile < ActiveRecord::Base
  attr_accessible :email, :full_name, :gender, :image, :location, :user, :address, :user_attributes
  belongs_to :user
end
