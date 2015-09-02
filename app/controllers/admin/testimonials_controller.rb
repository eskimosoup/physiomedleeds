module Admin
  class TestimonialsController < Manticore::ApplicationController
  
    def index
      @testimonials = Testimonial.order(:position)
    end
    
    def new
      @testimonial = Testimonial.new
    end
    
    def create
      @testimonial = Testimonial.new(params[:testimonial])
      if @testimonial.save
        redirect_to admin_testimonials_path, :notice => "Testimonial successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @testimonial = Testimonial.find(params[:id])
    end
    
    def update
      @testimonial = Testimonial.find(params[:id])
      if @testimonial.update_attributes(params[:testimonial])
        redirect_to admin_testimonials_path, :notice => "Testimonial successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @testimonial = Testimonial.find(params[:id])
      @testimonial.destroy
      redirect_to admin_testimonials_path, :notice => "Testimonial destroyed."
    end
    
  end
end
