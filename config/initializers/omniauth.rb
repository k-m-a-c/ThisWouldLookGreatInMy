OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    provider :fiveHundredPx, Figaro.env.consumer_key, Figaro.env.consumer_secret
end