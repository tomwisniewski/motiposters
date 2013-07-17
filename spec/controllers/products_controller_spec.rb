require 'spec_helper'

describe ProductsController do

  describe "POST 'create'" do
    it "returns http success" do
      post 'create'
      response.should redirect_to products_path
    end
  end

  describe "DELETE 'destroy'" do
    it "returns http success" do
      delete 'destroy', :id => 1
      response.should redirect_to products_path
    end
  end

  describe "PUT 'update'" do
    it "returns http success" do
      put 'update', :id => 1
      response.should redirect_to products_path
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', :id => 1
      response.should be_success
      expect(response).to render_template("show")
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit', :id => 1
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
