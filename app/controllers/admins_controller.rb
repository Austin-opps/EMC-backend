class AdminsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

  # get /admin

  def index
    admins = Admin.all
    render json: admins, except: [:created_at, :updated_at]
  end

  def show
    admin = admin_find
    render json: admin, except: [:created_at, :updated_at], include: :products
  end

  # delete /admin/:id

  def destroy
    admin = admin_find
    admin.destroy
    render json: {}, status: 204
  end

  private

  def admin_find
    admin = Admin.find(params[:id])
  end

  def admin_params
    params.permit(:name, :email, :password, :password_confirmation, :profile_picture)
  end

  def render_not_found_response
    render json: { error: "User not found" }, status: 404
  end
end
