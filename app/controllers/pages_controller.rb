class PagesController < ApplicationController

  def show
    @page = Page.where(:display => true).find(params[:id])
    @testimonials = Testimonial.where(:display => true).order("rand()").limit(1)
    
    @side_articles = Article.where("display = ? AND date <= ?", true, Date.today).order("date DESC").limit(2)
    
    
    unless @page.branch.blank?
      @current_branch = @page.branch
      @root = @page.branch.root
    end

    if @page.style == "treatments"
      @treatments = Treatment.order(:position).where(:display => true)
    end
    
    if @page.style == "prices"
      @prices = Price.order(:position).where(:display => true)
    end

    render :layout => @page.layout
  end

end
