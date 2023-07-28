class AdminsController < ApplicationController
    def create
        admin = Admin.new(admin_params)
        if admin.save
          render json: admin, status: :created
        else
          render json: { errors: admin.errors.full_messages }, status: :unprocessable_entity
        end
    end
    
    def update
        admin = Admin.find(params[:id])
        if admin.update(admin_params)
            render json: admin, status: :ok
        else
            render json: { errors: admin.errors.full_messages }, status: :unprocessable_entity
        end
    end
    
    def destroy
        admin = Admin.find(params[:id])
        admin.destroy
        head :no_content
    end
    
      private
    
    def admin_params
        params.require(:admin).permit(:name, :email, :password)
    end
end
