require 'spec_helper'
require 'capybara/rspec'


describe "viewing posters" do
  it "should show a list of motivational products" do
    visit '/products'
    expect(page).to have_content "Upload a Poster"
    expect(page).to have_content "sell?"
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
    product = FactoryGirl.create(:product)
    visit '/products'
    click_link product.title
    expect(Product.count).to eql 1
    click_button "Delete"
    expect(Product.count).to eql 0
    expect(page).to have_content "Upload a Poster"
    expect(page).to have_content "sell?"
    expect(page).to have_no_content product.title
  end
end

describe "viewing a product" do
  before(:each) do
    @product = FactoryGirl.create(:product)
  end

  it "should show a page for the product" do 
    visit '/products' 
    click_link @product.title
    expect(page).to have_content "MotiPoster - #{@product.title}"
  end

  context "when finished viewing" do
    it "user can navigate back to the list of all products" do
      visit '/products'
      click_link @product.title
      click_link "Back to all products"
      expect(page).to have_content "Upload a Poster"
      expect(page).to have_content "sell?"
    end
  end
end

describe "editing a single product" do
  it "shows the poster details" do
    product = FactoryGirl.create(:product)
    visit '/products/' + product.id.to_s
    expect(page).to have_content product.title
    click_button "Edit"
    expect(page).to have_content "Edit Product"
  end
end

describe "adding a new product" do

  it "should add a new poster to the database" do
    visit '/products'
    click_link "Upload a Poster"
    expect(page).to have_content "Upload a Poster"
    fill_in "Title", :with => "May the force be with you"    
    attach_file "product[avatar]", 'spec/fixtures/test.png'
    fill_in "Price", :with => "1100"
    expect(Product.count).to eql 0
    click_button "Create Product"
    expect(Product.count).to eql 1
    expect(page).to have_content "May the force be with you"
  end
end

describe "ordering a product" do
  it "should show order confirmation" do
    order = FactoryGirl.create(:order)
    visit order_path(order)
    expect(page).to have_content "May the force be with you"
    expect(page).to have_content "John Smith"
  end

  it "should send a confirmation email" do
    order = FactoryGirl.create(:order)    
    expect(ActionMailer::Base.deliveries.count).to eq(1)
    ActionMailer::Base.deliveries.last.should have_content("Subject: Order Confirmation")
    ActionMailer::Base.deliveries.last.should have_content("motiposter@gmail.com")
    ActionMailer::Base.deliveries.last.should have_content("To: john@example.com")
    ActionMailer::Base.deliveries.last.body.should have_content("#{order.product.title}")
  end

  it "should display all orders" do
    3.times { FactoryGirl.create(:order) }
    @orders = Order.all
    @orders.count.should eq(3)
    visit orders_path
    expect(page).to have_content "#{@orders.first.id}" #weak
    expect(page).to have_content "#{@orders.last.id}"
  end
end