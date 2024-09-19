class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@healthscheduler.com"
  layout "mailer"
end
