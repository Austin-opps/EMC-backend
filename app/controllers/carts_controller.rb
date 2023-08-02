class CartsController < ApplicationController

    def index
        carts = Cart.all
        render json: carts
    end

end
