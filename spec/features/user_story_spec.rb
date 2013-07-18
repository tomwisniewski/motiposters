require 'spec_helper'
require 'capybara/rspec'

describe "viewing posters" do
  it "should show a list of motivational products" do
    visit '/'
    expect(page).to have_content "MotiPoster"
    expect(page).to have_content "Products"
  end
end

describe "adding products" do
  context "when poster is added correctly" do
    it "redirects to the list of products and confirms the addition of the product" do

    end
  end
end

describe "deleting products" do
  it "should remove products from the list of products" do
    
  end
end

describe "viewing a product" do
  it "should show a page for the product" do
    product = FactoryGirl.create(:product)
    visit '/'
    click_link product.title
    expect(page).to have_content "MotiPoster - #{product.title}"
  end
end

describe "ordering a product" do

  it "should show order confirmation" do
    order = FactoryGirl.create(:order)
    visit order_path(order)
    expect(page).to have_content "May the force be with you"
    expect(page).to have_content "John Smith"
  end

  it "should display all orders" do
    3.times { FactoryGirl.create(:order) }
    @orders = Order.all
    @orders.count.should eq(3)
    visit orders_path
    expect(page).to have_content "1" #weak
    expect(page).to have_content "3"
  end
end