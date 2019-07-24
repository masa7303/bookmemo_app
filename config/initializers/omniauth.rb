Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, ENV['API_key'], ENV['API_secret']
end
