class ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end

  def create
    redirect_to products_path
  end

  def destroy
    redirect_to products_path
  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes(
      :title => params[:products][:title],
      :image => params[:products][:image],
      :price => params[:products][:price])
    if @product.valid?
      redirect_to products_path, id: @product.id
    else
      render :edit
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
  end

  def new
  end

end
