class TestimonialsController < ApplicationController
   
    skip_before_action :authorized, only: [:index,:show,:create, :edit, :update, :destroy]
  
    def index
      testimonials = Testimonial.all
      render json: testimonials
    end
  
    def show
      testimonial = set_testimonial
      render json: testimonial,status: :ok
    end
  
    def new
      testimonial = Testimonial.new
    end
  
    def create
      testimonial = Testimonial.create!(testimonial_params)
      if testimonial
        render json: testimonial, status: :created
      else
        render json:{ error: testimonial.errors}, status: :unprocessable_entity
      end
    end
  
    def update
      if testimonial.update(testimonial_params)
        render json: testimonial
      else
        render json: testimonial.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      testimonial.destroy
      render json: { message: 'Testimonial deleted successfully' }
    end
  
    private
  
    def set_testimonial
       Testimonial.find(params[:id])
    end
  
    def testimonial_params
      params.require(:testimonial).permit(:product_id, :message)
    end
  end

  
  
