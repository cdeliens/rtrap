class Authorization < ActiveRecord::Base
  belongs_to :user
  validates :provider, :uid, :presence => true
  attr_accessible :provider, :uid, :user
  
  def self.find_or_create(auth_hash)
    unless auth = find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
      
      email = auth_hash["info"]["email"].present? ? auth_hash["info"]["email"] : auth_hash["info"]["nickname"] + "@missing.com"
      binding.pry
      user = User.create( :username => auth_hash["info"]["nickname"] , :password => "deliens", :password_confirmation => "deliens", :email => email)
      auth = create :user => user, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
      profile = ProfileFactory.send( "#{auth.provider}", user, auth_hash)
    end
    auth
  end
end
