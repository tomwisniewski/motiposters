require 'spec_helper'

describe OrdersController do
  describe "creating an order" do

    before(:each) do
      post :create, {
        product_id: 1,
        name: "John Smith",
        email: "john@example.com",
        street: "City Road",
        postcode: "NW1 34Q",
        city: "London", 
        stripeToken: "random_sting_to_get_later",
        amount: 1000
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