Devise.setup do |config|
  require 'devise/orm/active_record'

  config.mailer_sender = 'eleven.el.sg@gmail.com'
  config.mailer = 'Devise::Mailer'
  config.parent_mailer = 'ActionMailer::Base'

  config.authentication_keys = [:email]
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.http_authenticatable = false
  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 11

  config.send_email_changed_notification = true
  config.send_password_change_notification = true

  config.reconfirmable = true

  config.confirmation_keys = [:email]

  config.remember_for = 2.weeks

  config.expire_all_remember_me_on_sign_out = true


  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  config.timeout_in = 30.minutes

  config.lock_strategy = :failed_attempts
  config.unlock_keys = [:email]

  config.unlock_strategy = :both

  config.maximum_attempts = 5

  config.unlock_in = 1.hour
  config.last_attempt_warning = true
  config.reset_password_keys = [:email]
  config.reset_password_within = 12.hours

  config.sign_in_after_reset_password = true

  config.scoped_views = true

  config.default_scope = :user
  config.sign_out_all_scopes = true

  config.sign_out_via = :delete
end
