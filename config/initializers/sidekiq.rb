require 'sidekiq/web'

Sidekiq::Logging.logger.level = Logger::INFO

#configure Sidekiq for dev environment
if Rails.env.development?
  Sidekiq::Logging.logger.level = Logger::DEBUG
  Rails.logger = Sidekiq::Logging.logger
  ActiveRecord::Base.logger = Sidekiq::Logging.logger
end

Sidekiq.configure_server do |config|
  config.redis = { url: Figaro.env.sidekiq_redis_url }
end

Sidekiq.configure_client do |config|
  config.redis = { url: Figaro.env.sidekiq_redis_url }
end

Sidekiq::Web.set :session_secret, Rails.application.secrets[:secret_key_base]

# Trying to workaround the IPSpoofing issue when accessing /sidekiq via HAProxy
Sidekiq::Web.use(::Rack::Protection, except: :ip_spoofing)
