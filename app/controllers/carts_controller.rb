class CartsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
skip_before_action :authorized, only: [:index ,:show, :create , :update, :destroy] #you need  user authorization to view data or you can just uncomment this line
    def index
        carts = Cart.all
        render json: carts
    end

    def show 
        cart = cart_find
        render json: cart, status: :ok
    end

    def create
        cart = Cart.create!(cart_params)
        render json: cart, status: :created
    end


    def update
        cart = cart_find
        cart.update(cart_params)
        render json: cart, status: 200
    end


    def destroy
        cart = cart_find
        cart.destroy
        render json: {} , status: 204
    end


    private
    def cart_find
        Cart.find(params[:id])
    end

    def cart_params
        params.permit(:user_id, :product_id, :quantity)
    end

    def render_not_found_response
        render json: {error: "Cart not found"}, status: 404
    end

end
