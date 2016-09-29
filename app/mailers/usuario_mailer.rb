########################################
# File:usuario_mailer.rb
# Porpose: Mailer that help send emails.
# GNU AGPLv3
########################################
class UsuarioMailer < ApplicationMailer
	default from: ENV["EMAIL_ADDRESS"]
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.usuario_mailer.newuser.subject
  #
  def newuser(user)
    @greeting = "Hi"
    @newuser = user
    @name = user.name
    @link = "http://localhost:3000"

    mail to: @newuser.email, subject: "New user"
  end
end
