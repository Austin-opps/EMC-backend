class AdminsController < ApplicationController
  skip_before_action :authorized, only: [:index ,:show, :create , :update, :destroy] #you need  user authorization to view data or you can just uncomment this line

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

  def create
    admin = Admin.create!(admin_params)
    render json: admin, status: :created
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
    render json: { error: "Admin not found" }, status: 404
  end
end
