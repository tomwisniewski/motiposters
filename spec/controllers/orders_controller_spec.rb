require 'spec_helper'
require 'helpers'

RSpec.configure do |c|
  c.include Helpers
end

describe OrdersController do
  describe "creating an order" do

    before(:each) do
      product = FactoryGirl.create(:product)      

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
      stub_stripe
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
      Order.last.email.should eq("john@example.com")
    end

  end
end
