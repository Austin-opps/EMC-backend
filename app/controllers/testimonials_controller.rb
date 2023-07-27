class TestimonialsController < ApplicationController
    def index
        product_id = params[:product_id]
        testimonials = Testimonial.where(product_id: product_id)
        render json: testimonials
      end
  
      def create
          product_id = params[:product_id]
          user_id = params[:user_id]
          testimonials = params[:testimonials]
      
          testimonial = Testimonial.new(product_id: product_id, user_id: user_id, testimonials: testimonials)
      
          if testimonial.save
            render json: testimonial
          else
            render json: { error: "Error saving testimonial" }, status: :internal_server_error
          end
      end
      
      def destroy
      product_id = params[:product_id]
      testimonial_id = params[:testimonial_id]
  
      testimonial = Testimonial.find_by(id: testimonial_id, product_id: product_id)
  
      if testimonial.nil?
          render json: { error: "Testimonial not found" }, status: :not_found
      else
          testimonial.destroy
          render json: { message: "Testimonial deleted successfully" }
      end
      end
end
