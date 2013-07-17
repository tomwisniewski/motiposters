class ProductsController < ApplicationController
  
  def index
  end

  def create
    Product.create!(
      :title => params[:products][:title],
      :image => params[:products][:image],
      :price => params[:products][:price])
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
      redirect_to edit_product_path, id: @product.id
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
