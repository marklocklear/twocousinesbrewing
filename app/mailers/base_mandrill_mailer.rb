#https://robots.thoughtbot.com/how-to-send-transactional-emails-from-rails-with-mandrill

require "mandrill"

class BaseMandrillMailer < ActionMailer::Base
  default(
    from: "info@twocousinsbrewing.com",
    reply_to: "info@twocousinsbrewing.com"
  )

  private

  def send_mail(email, subject, body)
    mail(to: email, subject: subject, body: body, content_type: "text/html")
  end

  def mandrill_template(template_name)
    mandrill = Mandrill::API.new(Rails.application.secrets.SMTP_PASSWORD)
    mandrill.templates.render(template_name, [])["html"]
  end
end