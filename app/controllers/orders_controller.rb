require "stripe"



class OrdersController < ApplicationController

  def create

    @amount = Product.find(params[:product_id]).amount

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

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to orders_path
    
  end
end
