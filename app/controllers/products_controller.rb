class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy
    redirect_to products_path
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      redirect_to product_path(@product)
    else
      redirect_to edit_product_path(@product)
    end
  end

  def show
    @product = Product.find(params[:id])
    # @order = Order.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

private

  def product_params
    params.require(:product).permit(:title, :price, :avatar)
  end

end
