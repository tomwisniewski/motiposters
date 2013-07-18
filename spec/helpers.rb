module Helpers

  def stub_stripe       
    Stripe::Charge.stub(:create) {}
  end

  def order_params
    product = FactoryGirl.create(:product)
    {
      product_id: product.id,
      name: "John Smith",
      email: "john@example.com",
      street: "City Road",
      postcode: "NW1 34Q",
      city: "London", 
      price: product.price,
      stripeToken: "tok_u5dg20Gra"
    }
  end

end