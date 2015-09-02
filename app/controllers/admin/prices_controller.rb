module Admin
  class PricesController < Manticore::ApplicationController
  
    edit_images_for Price, [:image]
  
    def index
      @prices = Price.order(:position)
    end
    
    def new
      @price = Price.new
    end
    
    def create
      @price = Price.new(params[:price])
      if @price.save
        redirect_to admin_prices_path, :notice => "Price successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @price = Price.find(params[:id])
    end
    
    def update
      @price = Price.find(params[:id])
      if @price.update_attributes(params[:price])
        redirect_to admin_prices_path, :notice => "Price successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @price = Price.find(params[:id])
      @price.destroy
      redirect_to admin_prices_path, :notice => "Price destroyed."
    end
    
  end
end
