class BodyPartSectionsController < ApplicationController

    before_filter {@body_part = BodyPart.find(params[:body_part_id])}

    def show
      @testimonials = Testimonial.where(:display => true).order("rand()").limit(1)
      @body_part_section = BodyPartSection.where(:display => true).find(params[:id])
      if request.path != body_part_body_part_section_path(@body_part, @body_part_section)
        return redirect_to body_part_body_part_section_path(@body_part, @body_part_section), :status => :moved_permanently
      end
      static_page = Willow::StaticPage.find_by_name("Know Your Body")
      unless static_page.blank? or static_page.branch.blank?
        @current_branch = static_page.branch
      end
      @body_parts = BodyPart.where(:display => true).order(:position)
      @body_part_sections = @body_part.body_part_sections.where(:display => true).order(:position)
    end

  end