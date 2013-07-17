require 'spec_helper'

describe ProductsController do

  describe "GET 'create'" do
    it "returns http success" do
      post 'create'
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "returns http success" do
      delete 'destroy', :id => 1
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      put 'update', :id => 1
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', :id => 1
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get 'edit', :id => 1
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

end
