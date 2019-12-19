Devise.setup do |config|
  require 'devise/orm/active_record'

  config.skip_session_storage = [:http_auth]
  config.scoped_views = true

  config.timeout_in = 20.minutes if Rails.env.production?
  config.sign_out_via = :delete
  config.mailer_sender = Figaro.env.eleven_email_username

end
