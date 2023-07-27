class UsersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    # get /users

    def index 
        users = User.all
        render json: users
    end

    # get /users/:id - single user 

    def show 
        user = user_find
        render json: user, status: 200
    end

    # post /users

    def create
        users = User.create!(user_params)
        render json: users, status: 201
    end

    # update /users/:id
    def update
        user = user_find
        user.update(user_params)
        render json: user, status: 200
    end

    # delete /users/:id

    def destroy
        user = user_find
        user.destroy
        render json: {} , status: 204
    end

    private
    def user_find
        user = User.find(params[:id])
    end

    def user_params
        params.permit(:name, :email, :password, :password_confirmation , :profile_picture)
    end

    def render_not_found_response
        render json: {error: "User not found"}, status: 404
    end

    
end
