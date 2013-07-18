require "stripe"

class OrdersController < ApplicationController

  def create
    @order = Order.new(order_params)
    create_charge(params[:stripeToken], @order.product.price)
    if @order.save!
      OrderMailer.order_confirmation(@order).deliver
      redirect_to order_path(@order.id) 
    else
      redirect_to product_path(params[:id])
    end
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to root_url
  end

  def show
    @order = Order.find(params[:id])
  end

  def index
    @orders = Order.all
  end

private

  def order_params
    params.require(:order).permit(:product_id, :name, :email, :street, :postcode, :city)
  end

  def create_charge(token, amount)
    charge = Stripe::Charge.create(
      :card        => token,
      :amount      => amount,
      :description => 'Rails Stripe customer',
      :currency    => 'GBP'
    )
  end

end
