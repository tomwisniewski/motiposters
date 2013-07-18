class ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end

  def create
    Product.create!(
      :title => params[:product][:title],
      :image => params[:product][:image],
      :price => params[:product][:price])
    redirect_to products_path
  end

  def destroy
    redirect_to products_path
  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes(
      :title => params[:product][:title],
      :image => params[:product][:image],
      :price => params[:product][:price])
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
