class ProfileFactory
  class << self
    def facebook(user, auth_hash)
      translated_data = {image: auth_hash["info"]["image"],
        full_name: auth_hash["info"]["name"],
        email: auth_hash["info"]["email"],
        location: auth_hash["info"]["location"],
        gender: auth_hash["extra"]["raw_info"]["gender"]}
      factory user, translated_data
    end
    def twitter(user, auth_hash)
      translated_data = {image: auth_hash["info"]["image"],
        full_name: auth_hash["info"]["name"],
        location: auth_hash["info"]["location"],
        }
      factory user, translated_data
    end
    private 
    def factory(user, data)
      profile = Profile.create(user: user)
      profile.update_attributes(data)
    end
  end
end