class OrderMailer < ActionMailer::Base
  default :from => "motiposter@gmail.com"

  def order_confirmation(order)
    @order = order
    mail(:to => @order.email, :subject => "Order Confirmation")
  end

end