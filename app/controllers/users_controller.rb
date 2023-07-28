class UsersController < ApplicationController
    def add_to_cart
        user = User.find(params[:user_id])
        product = Product.find(params[:product_id])
        cart = Cart.new(user: user, product: product)
        if cart.save
          render json: cart, status: :created
        else
          render json: { errors: cart.errors.full_messages }, status: :unprocessable_entity
        end
    end
    
    def remove_from_cart
        cart = Cart.find_by(user_id: params[:user_id], product_id: params[:product_id])
        if cart
            cart.destroy
            head :no_content
        else
            render json: { error: "Cart item not found" }, status: :not_found
        end
    end
    
end
