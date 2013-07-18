require 'spec_helper'
require 'helpers'

RSpec.configure do |c|
  c.include Helpers
end

describe OrdersController do
  describe "creating an order" do

    before(:each) do
      product = FactoryGirl.create(:product)      

      stub_stripe
      post :create, {
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
    
    it "should have no error messages" do
      flash[:error].should be(nil)
    end
   
    it "should add processed order to database" do      
      Order.last.email.should eq("john@example.com")
    end

  end
end
