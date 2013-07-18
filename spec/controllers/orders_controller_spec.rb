require 'spec_helper'


describe OrdersController do
  describe "creating an order" do

    before(:each) do

      product = Product.find_by(title: "Beard")

    token = {
      id: "tok_u5dg20Gra",
      number: '4242424242424242',
      exp_month: '11',
      exp_year: '2015',
      cvc: '423',
      # name: "John Smith",
      # address_line1: "City Road",
      created: 1352222493,
      object: "token",
      used: false
    }
      post :create, {
        product_id: product.id,
        name: "John Smith",
        email: "john@example.com",
        street: "City Road",
        postcode: "NW1 34Q",
        city: "London", 
        price: product.price,
        stripeToken: token
      }
    end
    
    it "should have no error messages" do
      flash[:error].should be(nil)
    end
   
    it "should add processed order to database" do
      # expect {  customer = Stripe::Customer.create() }.to_not raise_error
      # expect {  charge = Stripe::Charge.create() }.to_not raise_error

      Order.last.email.should eq("john@example.com")
    end
  end

  describe "show order" do

    before(:each) do

      @product = Product.find_by(title: "Beard")
    
    end
    
    it "should show order upon completion" do

      order = Order.create(
        product_id: @product.id,
        name: "John Smith",
        email: "john@example.com",
        street: "City Road",
        postcode: "NW1 34Q",
        city: "London" 
        )

      get 'show', id: order.id
      expect(page).to render_template :show
    end
  end
end