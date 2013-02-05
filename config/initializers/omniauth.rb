Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "PgCKBOxfUnEa0f0W1Oi3tQ", "u8Cu09apHX2LQ4oKEvF0JT0KPzYfGmmHkPfizGisJM"
  OmniAuth.config.logger = Rails.logger
end

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :facebook, '487732591290570', '3a4fe8bcf72cf513f563b191d416bb31'
end