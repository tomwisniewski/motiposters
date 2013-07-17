class ProductsController < ApplicationController
  
  def index
  end

  def create
    redirect_to products_path
  end

  def destroy
    redirect_to products_path
  end

  def update
    redirect_to products_path
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end

  def new
  end

end
