class TestimonialsController < ApplicationController
  def index
    @testimonials = Testimonial.where(:display => true).order(:position)
  end

  def show
  end
end
