class Profile < ActiveRecord::Base
  attr_accessible :email, :full_name, :gender, :image, :location, :user
  belongs_to :user
end
