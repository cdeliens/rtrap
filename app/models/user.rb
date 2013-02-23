class User < ActiveRecord::Base
  has_one :profile, :dependent => :destroy
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Setup accessible (or protected) attributes for your model
  attr_accessible  :username, :password, :password_confirmation, :remember_me, :email, :profile, :profile_attributes
  has_many :authorizations, :dependent => :destroy
  accepts_nested_attributes_for :profile

  def add_provider(auth_hash)
    unless authorizations.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
      Authorization.create :user => self, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
    end
  end

end
