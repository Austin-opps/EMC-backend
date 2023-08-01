class ProductsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
     skip_before_action :authorized, only: [:index ,:show] #you need  user authorization to view data or you can just uncomment this line
    def index
      products = Product.all
      render json: products , status: 200
    end
  
    def show
      product = Product.find(params[:id])
      render json: product, status: :ok
    end
  
    def create
      product = Product.new(product_params)
      if product.save
        render json: product, status: :created
      else
        render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      product = Product.find(params[:id])
      if product.update(product_params)
        render json: product, status: :ok
      else
        render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      product = Product.find(params[:id])
      product.destroy
      head :no_content
    end
  
  
    private
    def product_params
      params.require(:product).permit(:name, :price, :image, :description,  :category, :quantity)
    end
    def render_not_found_response
      render json: {error: "Product not found"}, status: 404
    end
  end
