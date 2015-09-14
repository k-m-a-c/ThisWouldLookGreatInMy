F00px.configure do |config|
  config.consumer_key = Figaro.env.consumer_key
  config.consumer_secret = Figaro.env.consumer_secret
end