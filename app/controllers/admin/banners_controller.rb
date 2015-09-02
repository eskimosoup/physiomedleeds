module Admin
  class BannersController < Manticore::ApplicationController

    crops_images_for Banner, :image, { :show => { :fill => [580, 429] } }

    def index
      @banners = Banner.order(:position)
    end
    
    def new
      @banner = Banner.new
    end
    
    def create
      @banner = Banner.new(params[:banner])
      if @banner.save
        redirect_to admin_banners_path, :notice => "Banner successfully created."
      else
        render :action => 'new'
      end
    end

    def edit
      @banner = Banner.find(params[:id])
    end
    
    def update
      @banner = Banner.find(params[:id])
      if @banner.update_attributes(params[:banner])
        redirect_to admin_banners_path, :notice => "Banner successfully updated."
      else
        render :action => 'edit'
      end
    end
    
    def destroy
      @banner = Banner.find(params[:id])
      @banner.destroy
      redirect_to admin_banners_path, :notice => "Banner destroyed."
    end
    
  end
end
