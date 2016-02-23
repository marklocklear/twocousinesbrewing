#https://robots.thoughtbot.com/how-to-send-transactional-emails-from-rails-with-mandrill

class WelcomeMailer < BaseMandrillMailer
  def welcome(email)
    subject = "Welcome to Two Cousins Brewing!"
    body = mandrill_template("welcome")
    send_mail(email, subject, body)
  end
end