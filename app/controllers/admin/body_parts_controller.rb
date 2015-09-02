module Admin
  class BodyPartsController < Manticore::ApplicationController

    edit_images_for BodyPart, [:image]

    def index
      @body_parts = BodyPart.all
    end

    def new
      @body_part = BodyPart.new
    end

    def create
      @body_part = BodyPart.new(params[:body_part])
      if @body_part.save
        redirect_to admin_body_parts_path, :notice => "Body part successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @body_part = BodyPart.find(params[:id])
    end

    def update
      @body_part = BodyPart.find(params[:id])
      if @body_part.update_attributes(params[:body_part])
        redirect_to admin_body_parts_path, :notice => "Body part successfully updated."
      else
        render :action => 'edit'
      end
    end

    def destroy
      @body_part = BodyPart.find(params[:id])
      @body_part.destroy
      redirect_to admin_body_parts_path, :notice => "Body part destroyed."
    end

  end
end
