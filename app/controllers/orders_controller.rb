require "stripe"

class OrdersController < ApplicationController

  def create
    order = Order.new(order_params)
    order.save!
    create_charge(params[:order][:stripe_card_token ], order.product.price)
    redirect_to order_path(order.id)
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
