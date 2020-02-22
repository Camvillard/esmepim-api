class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.recipe_book.subject
  #
  def recipe_book
    @greeting = "Hi"
    @email = params[:email]
    @amount = params[:amount]
    @order = params[:order]

    mail(to: @email, subject: 'voilà le livre de recettes !')
  end
end
