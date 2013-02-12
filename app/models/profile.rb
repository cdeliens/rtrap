class Profile < ActiveRecord::Base
  attr_accessible :email, :full_name, :gender, :image, :location, :user, :address
  belongs_to :user
end
