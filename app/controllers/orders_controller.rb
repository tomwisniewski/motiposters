require "stripe"



class OrdersController < ApplicationController

  def create

    @amount = Product.find(params[:product_id]).price

    charge = Stripe::Charge.create(
      :card  => params[:stripeToken],
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
    redirect_to order_path(order.id)
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
  end

  def show
    @order = Order.find(params[:id])
    @product = Product.find(@order.product_id)
  end
end
