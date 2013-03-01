class Profile < ActiveRecord::Base
  attr_accessible  :full_name, :gender, :image, :location, :user, :address, :user_attributes
  belongs_to :user, :dependent => :destroy
  accepts_nested_attributes_for :user
  def complete?
    state = true
    self.attributes.each do |key, value|
      state = false if value.blank?
    end
    state
  end
  
end
