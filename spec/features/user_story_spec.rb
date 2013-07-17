require 'spec_helper'

describe "viewing posters" do
  it "should show a list of motivational products" do
    visit '/'
    expect(page).to have_content "Products"
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
    
  end
end

describe "ordering a product" do
  it "should..." do

  end
end