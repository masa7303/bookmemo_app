class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.contact_mail.subject
  #

  # メールがあればG_MAILアドレスで受信
  def contact_mail(contact)
    @contact = contact
    mail to: ENV['G_MAIL'], subject: "問い合わせがありました。"
  end

end
