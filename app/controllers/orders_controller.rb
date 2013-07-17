require "stripe"



class OrdersController < ApplicationController

  def create

    @amount = Product.find(params[:product_id]).price

    customer = Stripe::Customer.create(
      :email => params[:email], # are we saving to DB? or is this a current user? 
      :card  => params[:stripeToken]
    )    

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'GBP'
    )


      order = Order.create!(
        :product_id => params[:product_id],
        :name => params[:name],
        :email => params[:email],
        :street => params[:street],
        :postcode => params[:postcode],
        :city => params[:city]
        )
      # debugger
    redirect_to order_path(order.id)
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
  end

  def show
  end
end
