# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/recipe_book
  def recipe_book
    UserMailer.with(email: 'ca.villard@gmail.com', amount: Product.first.price, order: Order.first).recipe_book
  end

end
