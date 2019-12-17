require 'sidekiq/web'

Sidekiq.configure_server do |config|
  config.redis = { url: Figaro.env.sidekiq_redis_url }
end

Sidekiq.configure_client do |config|
  config.redis = { url: Figaro.env.sidekiq_redis_url }
end

Sidekiq::Web.set :session_secret, Rails.application.secrets[:secret_key_base]
