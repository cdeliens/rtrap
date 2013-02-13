Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, TWITTER[:key], TWITTER[:secret]
  OmniAuth.config.logger = Rails.logger
end

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, FACEBOOK[:key], FACEBOOK[:secret]
end