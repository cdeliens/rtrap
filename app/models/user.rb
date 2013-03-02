class User < ActiveRecord::Base
  has_one :profile, :dependent => :destroy
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Setup accessible (or protected) attributes for your model
  attr_accessible  :username, :password, :password_confirmation, :remember_me, :email, :profile, :profile_attributes, :role_ids, :provider
  has_many :authorizations, :dependent => :destroy
  has_and_belongs_to_many :roles

  accepts_nested_attributes_for :profile
  # validates :email, :presence => true, if: 'provider.nil?'
  # validates :password, :presence => true

  def add_provider(auth_hash)
    unless authorizations.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
      Authorization.create :user => self, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
    end
  end
  
  def role?(role)
      return !!self.roles.find_by_name(role.to_s.camelize)
  end

  def email_required?
    super && provider.nil?
  end

end
