class TreatmentsController < ApplicationController

  # GET /treatments
  #def index
  #  @page = Page.where("title = ?", "Treatments").first
  #  @treatments = Treatment.order(:position).where(:display => true)
  #end

  # GET /treatments/1
  def show
    @treatments = Treatment.order(:position).where(:display => true)
    @treatment = Treatment.find(params[:id])
  end
end

