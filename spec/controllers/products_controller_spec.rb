require 'spec_helper'

describe ProductsController do

  before(:each) do
    @product = Product.create(
      :title => "Poster 1",
      :image => "moti1.jpg",
      :price => "1100")
  end

  describe "POST 'create'" do
    context "when valid product details are provided" do
      it "adds a product to the database and redirects to the products index page" do
        expect(Product.count).to eql 1
        post 'create',  :products => 
            { :title => "New poster",
              :image => "moti1.jpg",
              :price => "1500"}
        expect(Product.count).to eql 2
        response.should redirect_to products_path
      end
    end

    context " when INvalid product details are given" do
      it "does not add to the database and redirects to the new page" do
        expect(Product.count).to eql 1
        post 'create',  :products => 
            { :title => 1,
              :image => "moti1.jpg",
              :price => "fourteen pounds"}
        expect(Product.count).to eql 1
        response.should redirect_to new_product_path
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
        put 'update', :id => @product.id, :products => {:price => "1200", :title => "New title"}
        response.should redirect_to products_path
      end
    end

    context " when INvalid product details are given" do
      it "does not update the database and redirects to the edit page" do
        expect(Product.count).to eql 1
        post 'create',  :products => 
            { :title => 1,
              :image => "moti1.jpg",
              :price => "fourteen pounds"}
        expect(Product.count).to eql 1
        response.should redirect_to edit_product_path
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
