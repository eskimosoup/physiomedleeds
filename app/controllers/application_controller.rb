class ApplicationController < ActionController::Base

  before_filter :set_seo_variables

  def sitemap
    @seo_entries = SeoEntry.where(:in_sitemap => true).order(:nominal_url)

    respond_to do |format|
      format.html
      format.xml
    end
  end

  def set_seo_variables
    @seo_entry = SeoEntry.find_by_nominal_url(request.path)
    
    if @seo_entry
      @title = @seo_entry.title
      @meta_description = @seo_entry.meta_description
      @meta_tags = @seo_entry.title
    else
      @meta_description = SITE_SETTINGS['Default Meta Description']
      @meta_tags = SITE_SETTINGS['Default Meta Tags']
    end
  end

  protect_from_forgery

  before_filter :nav_menu

  def index
    @articles = Article.where("display = ? AND date <= ?", true, Date.today).order("date DESC").limit(1)
    @banners = Banner.where(:display => true).order(:position)
    static_page = Willow::StaticPage.find_by_name("Home")
    unless static_page.blank? or static_page.branch.blank?
      @current_branch = static_page.branch
    end
    
    render :layout => "home"
  end

  private

  def nav_menu
    @action_quote = ActionQuote.where(display: true).order("rand()").first
    
    nav_menu = Willow::Branch.where(:tree => "Main Navigation")
    unless nav_menu.blank?
      @navigation = nav_menu.roots.order(:position)
    end
  end
end
