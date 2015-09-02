class ArticlesController < ApplicationController

  def index
    @articles = Article.where("display = ? AND date <= ?", true, Date.today).order("date DESC").page(params[:page]).per(10)
    @testimonials = Testimonial.where(:display => true).order("rand()").limit(1)
    static_page = Willow::StaticPage.find_by_name("News")
    unless static_page.blank? or static_page.branch.blank?
      @current_branch = static_page.branch
    end
  end

  def show
    @article = Article.where("display = ? AND date <= ?", true, Date.today).find(params[:id])
    @testimonials = Testimonial.where(:display => true).order("rand()").limit(1)
    if request.path != article_path(@article)
      redirect_to @article, status: :moved_permanently
    end
    @recent_articles = Article.where("display = ? AND date <= ?", true, Date.today).order("date DESC").limit(5)

    static_page = Willow::StaticPage.find_by_name("News")
    unless static_page.branch.blank?
      @current_branch = static_page.branch
    end
  end

end
