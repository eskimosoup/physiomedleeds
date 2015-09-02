class BodyPartsController < ApplicationController

  def index
    @testimonials = Testimonial.where(:display => true).order("rand()").limit(1)
    
    static_page = Willow::StaticPage.find_by_name("Know Your Body")
    unless static_page.blank? or static_page.branch.blank?
      @current_branch = static_page.branch
    end
    @body_parts = BodyPart.where(:display => true).order(:position)
  end

  def show
    @body_part = BodyPart.where(:display => true).find(params[:id])
    @testimonials = Testimonial.where(:display => true).order("rand()").limit(1)
    
    # If an old id or a numeric id was used to find the record, then
    # the request path will not match the post_path, and we should do
    # a 301 redirect that uses the current friendly id.
    if request.path != body_part_path(@body_part)
      return redirect_to @body_part, :status => :moved_permanently
    end
    static_page = Willow::StaticPage.find_by_name("Know Your Body")
    unless static_page.blank? or static_page.branch.blank?
      @current_branch = static_page.branch
    end
    @body_parts = BodyPart.where(:display => true).order(:position)
    @body_part_sections = @body_part.body_part_sections.where(:display => true).order(:position)
  end

end
