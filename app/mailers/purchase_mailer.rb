class PurchaseMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.purchase_mailer.thank_you.subject
  #
  def thank_you
    @greeting = "Hi"

    @user = params[:user]

    mail to: @user.email
  end
end
