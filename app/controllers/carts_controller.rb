class CartsController < ApplicationController
    def index
        user = User.find(params[:user_id])
        cart_items = user.products
        render json: cart_items, status: :ok
    end
end
