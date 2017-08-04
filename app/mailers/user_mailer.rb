class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def order_confirmation_email(order)
    @order = order
    @url  = 'http://0.0.0.0:3000'
    mail(to: order.email, subject: "Order #{@order.id} received!")
  end
end