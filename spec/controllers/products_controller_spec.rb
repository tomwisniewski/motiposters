require 'spec_helper'

describe ProductsController do

  before(:each) do
    @product = FactoryGirl.create(:product)
  end

  describe "POST 'create'" do
    context "when valid product details are provided" do
      it "adds a product to the database and redirects to the products index page" do
        expect(Product.count).to eql 1
        post 'create',  :product => 
            { :title => "New poster",
              :image => "moti1.jpg",
              :price => "1500"}
        response.should redirect_to products_path
        expect(Product.count).to eql 2
      end
    end
  end


  describe "DELETE 'destroy'" do
    it "returns http success" do
      delete 'destroy', :id => @product.id      
      response.should redirect_to products_path
    end

  end

  describe "PUT 'update'" do
    context "when valid attributes are provided" do
      it "updates the product and renders the product show page" do
        expect(Product.count).to eql 1
        put 'update', :id => @product.id, :product => {:price => "1200", :title => "New title"}
        expect(Product.count).to eql 1
        response.should redirect_to product_path(Product.last)
      end
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', :id => @product.id
      response.should be_success
      expect(response).to render_template("show")
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit', :id => @product.id
      response.should be_success
      expect(response).to render_template("edit")
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
      expect(response).to render_template("new")
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
      expect(response).to render_template("index")
    end
  end

end
