module Admin
  class BodyPartSectionsController < Manticore::ApplicationController

    before_filter {@body_part = BodyPart.find(params[:body_part_id])}
    def index
      @body_part_sections = @body_part.body_part_sections.order(:position)
    end

    def new
      @body_part_section = BodyPartSection.new({:body_part_id => @body_part.id})
    end

    def create
      @body_part_section = BodyPartSection.new(params[:body_part_section])
      if @body_part_section.save
        redirect_to admin_body_part_body_part_sections_path(@body_part), :notice => "Body part section successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @body_part_section = BodyPartSection.find(params[:id])
    end

    def update
      @body_part_section = BodyPartSection.find(params[:id])
      if @body_part_section.update_attributes(params[:body_part_section])
        redirect_to admin_body_part_body_part_sections_path(@body_part), :notice => "Body part section successfully updated."
      else
        render :action => 'edit'
      end
    end

    def destroy
      @body_part_section = BodyPartSection.find(params[:id])
      @body_part_section.destroy
      redirect_to admin_body_part_body_part_sections_path(@body_part), :notice => "Body part section destroyed."
    end

  end
end
