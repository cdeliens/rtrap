class ProfileFactory
  class << self
    def facebook(user, auth_hash)
      translated_data = {
        profile: {
          image: auth_hash["info"]["image"],
          full_name: auth_hash["info"]["name"],
          address: auth_hash["info"]["location"],
          gender: auth_hash["extra"]["raw_info"]["gender"]
          },
        user: {
          username: auth_hash["info"]["nickname"],
          email: auth_hash["info"]["email"],
          password: auth_hash[:credentials][:token],
          password_confirmation: auth_hash[:credentials][:token]
        }
      }
      factory user, translated_data
    end
    def twitter(user, auth_hash)
      translated_data = {
        profile: {
          image: auth_hash["info"]["image"],
          full_name: auth_hash["info"]["name"],
          address: auth_hash["info"]["location"]
        },
        user: {
          username: auth_hash["info"]["nickname"],
          password: auth_hash["extra"]["access_token"].params["oauth_token"],
          password_confirmation: auth_hash["extra"]["access_token"].params["oauth_token"]
        }
      }
      factory user, translated_data
    end
    private 
    def factory(user, data)
      profile = Profile.create!(user: user)
      profile.update_attributes data[:profile]
      user.update_attributes data[:user]
    end
  end
end