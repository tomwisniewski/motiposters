require 'spec_helper'
require 'capybara/rspec'

describe "viewing posters" do
  it "should show a list of motivational products" do
    visit '/'
    expect(page).to have_content "MotiPoster"
    expect(page).to have_content "Pick a product"
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
    visit '/'
    click_link 'Beard'
    expect(page).to have_content "MotiPoster - Beard"
  end
end

describe "ordering a product" do

  it "should show order confirmation" do

    order = Order.create( product_id: Product.find_by(title: "Beard").id, name: "John Smith", email: "john@example.com", street: "City Road", postcode: "NW1 34Q", city: "London" )

    visit order_path(order.id)
    expect(page).to have_content "Beard"
    expect(page).to have_content "John Smith"
  end
end