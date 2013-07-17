class ProductsController < ApplicationController
  
  def index
  end

  def create
  end

  def destroy
  end

  def update
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end

  def new
  end

end
