class ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products , except: [:created_at, :updated_at] , status: 200
  end

  def show
    products = product_find
    render json: products , except: [:created_at, :updated_at] , status: 200
  end

  def create
    products = Product.create(product_params)
    render json: products , except: [:created_at, :updated_at] , status: 201
  end


  private
  def product_find
    product = Product.find(params[:id])
  end

  def product_params
    params.permit(:name, :price, :image, :description, :category)
  end
end
