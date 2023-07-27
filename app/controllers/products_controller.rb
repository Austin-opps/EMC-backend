class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products , status: 200
  end

  def show
    products = product_find
    render json: products , status: 200
  end

  def create
    products = Product.create(product_params)
    render json: products ,  status: 201
  end

  def update
    products = product_find
    products.update(product_params)
    render json: products ,  status: 200
  end

  def destroy
    products = product_find
    products.destroy
    render json: {} , status: 204
  end


  private
  def product_find
    product = Product.find(params[:id])
  end

  def product_params
    params.permit(:name, :price, :image, :description, :category)
  end
end
