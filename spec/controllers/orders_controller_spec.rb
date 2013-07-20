require 'spec_helper'
require 'helpers'

RSpec.configure do |c|
  c.include Helpers
end

describe OrdersController do
  describe "creating an order" do

    before(:each) do
      stub_stripe
      post :create, order_params
    end

    it "should have no error messages" do
      flash[:error].should be(nil)
    end

    it "should add processed order to database" do
      expect(Order.count).to be(1)
      Order.last.email.should eq("john@example.com")
    end
  end

  describe "show order" do

    it "should show order upon completion" do
      order = FactoryGirl.create(:order) # "naughty boy" to be added here!
      get 'show', id: order.id
      expect(page).to render_template :show
    end

    it "should show all orders" do
      get :index
      expect(page).to render_template :index
    end
  end
end
