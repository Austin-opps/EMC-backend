class AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    user = User.find_by(name: params[:name])
    
      if user&.authenticate(params[:password])
        token = encode_token({ user_id: user.id })
        render json: { user: UserSerializer.new(user), jwt: token }, status: :accepted
      else
        render json: [error: "Invalid username or password"],status: :unauthorized
      end
      
  end
  
end

# ///////////////////////////////////
#   def destroy
#     session.delete(:user_id)
#     head :no_content
#   end
# end