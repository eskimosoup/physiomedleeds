class TeamMembersController < ApplicationController

  # GET /team_members
  def index
    static_page = Willow::StaticPage.find_by_name("Team")
    unless static_page.blank? or static_page.branch.blank?
      @current_branch = static_page.branch
    end
    
    @team_members = TeamMember.order(:position).where(display: true)
    @side_articles = Article.where("display = ? AND date <= ?", true, Date.today).order("date DESC").limit(2)
    @testimonials = Testimonial.where(:display => true).order("rand()").limit(1)
  end

  # GET /team_members/1
  def show
    @team_member = TeamMember.find(params[:id])
    @side_articles = Article.where("display = ? AND date <= ?", true, Date.today).order("date DESC").limit(2)
    @testimonials = Testimonial.where(:display => true).order("rand()").limit(1)
  end
end

