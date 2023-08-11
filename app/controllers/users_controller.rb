class UsersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
skip_before_action :authorized, only: [:create,:show]
 
# get /users
    def show 
        user = User.find_by(id: params[:id])
        render json: user,status: :ok
    end

    # get /users/:id - single user 

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    # post /users

    def create
        user = User.create!(user_params)
        token = encode_token(user_id: user.id)
        # user_data = current_user# Call the method without overwriting it
        render json: { user: UserSerializer.new(user), jwt: token }, status: :created
      rescue ActiveRecord::RecordInvalid => e
        render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
      end
      
    # # update /users/:id
    # def update
    #     user = user_find
    #     user.update(user_params)
    #     render json: user, status: 200
    # end

    # delete /users/:id

    def destroy
        user = user_find
        user.destroy
        render json: {} , status: 204
    end

    private


    def user_params
        params.permit(:name, :email, :password, :password_confirmation, :profile_picture)
    end

    def render_not_found_response
        render json: {error: "User not found"}, status: 404
    end

    
end
