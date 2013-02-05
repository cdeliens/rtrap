Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "PgCKBOxfUnEa0f0W1Oi3tQ", "u8Cu09apHX2LQ4oKEvF0JT0KPzYfGmmHkPfizGisJM"

  OmniAuth.config.logger = Rails.logger

  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET']
  end
end