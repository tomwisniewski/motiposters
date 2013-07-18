class ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end

  def create
    Product.create!(
      :title => params[:products][:title],
      :image => params[:products][:image],
      :price => params[:products][:price].to_i)
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
      :price => params[:products][:price].to_i)
    if @product.valid?
      redirect_to products_path, id: @product.id
    else
      redirect_to edit_product_path, id: @product.id
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

end
