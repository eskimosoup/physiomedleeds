module Admin
  class TreatmentsController < Manticore::ApplicationController

    edit_images_for Treatment, [:image]
  
    def index
      @treatments = Treatment.order(:position)
    end
    
    def new
      @treatment = Treatment.new
    end
    
    def create
      @treatment = Treatment.new(params[:treatment])
      if @treatment.save
        redirect_to admin_treatments_path, :notice => "Treatment successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @treatment = Treatment.find(params[:id])
    end
    
    def update
      @treatment = Treatment.find(params[:id])
      if @treatment.update_attributes(params[:treatment])
        redirect_to admin_treatments_path, :notice => "Treatment successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @treatment = Treatment.find(params[:id])
      @treatment.destroy
      redirect_to admin_treatments_path, :notice => "Treatment destroyed."
    end
    
  end
end
