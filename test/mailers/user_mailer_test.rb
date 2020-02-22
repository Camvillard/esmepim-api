require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "recipe_book" do
    mail = UserMailer.recipe_book
    assert_equal "Recipe book", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
