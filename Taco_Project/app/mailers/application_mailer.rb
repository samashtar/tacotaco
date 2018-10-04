class ApplicationMailer < ActionMailer::Base
  default from: 'tacocat.app@gmail.com'
  layout 'mailer'

  def receipt_email(user)
    @user = user
    mail(to: @user.email, subject: "Your TACOCAT Receipt")
  end
end
