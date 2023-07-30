class TestimonialsController < ApplicationController
   


    before_action :set_testimonial, only: [:show, :edit, :update, :destroy]
  
    def index
      @testimonials = Testimonial.all
      render json: @testimonials
    end
  
    def show
      render json: @testimonial
    end
  
    def new
      @testimonial = Testimonial.new
    end
  
    def create
      @testimonial = Testimonial.new(testimonial_params)
      if @testimonial.save
        render json: @testimonial, status: :created, location: @testimonial
      else
        render json: @testimonial.errors, status: :unprocessable_entity
      end
    end
  
    def edit
    end
  
    def update
      if @testimonial.update(testimonial_params)
        render json: @testimonial
      else
        render json: @testimonial.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @testimonial.destroy
      render json: { message: 'Testimonial deleted successfully' }
    end
  
    private
  
    def set_testimonial
      @testimonial = Testimonial.find(params[:id])
    end
  
    def testimonial_params
      params.require(:testimonial).permit(:author, :content)
    end
  end

  
  
