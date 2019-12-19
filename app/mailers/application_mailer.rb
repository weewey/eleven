class ApplicationMailer < ActionMailer::Base
  default from: Figaro.env.eleven_email_username
  layout 'mailer'
end
