
class UserMailerPreview < ActionMailer::Preview
  def order_confirmation_email
    UserMailer.order_confirmation_email(Order.first)
  end
end