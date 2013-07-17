require "stripe"



class OrdersController < ApplicationController

  def create

    @amount = Product.find(params[:product_id]).amount

    customer = Stripe::Customer.create(
      :email => params[:email], # are we saving to DB? or is this a current user? 
      :card  => params[:stripeToken]
    )    

    charge = Stripe::Charge.create(
      :customer    => :name,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'GBP'
    )

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to orders_show_path

      order = Order.create!(
        :product_id => params[:product_id],
        :name => params[:name],
        :email => params[:email],
        :street => params[:street],
        :postcode => params[:postcode],
        :city => params[:city]
        )

  end

end
