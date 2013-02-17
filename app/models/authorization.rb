class Authorization < ActiveRecord::Base
  belongs_to :user, :dependent => :destroy
  validates :provider, :uid, :presence => true
  attr_accessible :provider, :uid, :user
  
  def self.find_or_create(auth_hash)
    unless auth = find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
      auth = create_complete_user auth_hash
    end
    auth
  end

  def self.create_complete_user auth_hash
    email = auth_hash["info"]["email"].present? ? auth_hash["info"]["email"] : auth_hash["info"]["nickname"] + "@missing.com"
    user = User.create( :username => auth_hash["info"]["nickname"] , :password => "deliens", :password_confirmation => "deliens", :email => email)
    profile = ProfileFactory.send( auth_hash[:provider], user, auth_hash)
    auth = create :user => user, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
  end
end
