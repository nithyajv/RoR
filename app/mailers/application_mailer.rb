class ApplicationMailer < ActionMailer::Base
  default from: Rails.application.credentials.mail
  layout "mailer"
end
