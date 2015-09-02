class BookingsController < ApplicationController

  # GET /bookings/new
  def new
    static_page = Willow::StaticPage.find_by_name("Book Now")
    
    @page = Page.where("display = ? and title = ?", true, "Book Now").first
    
    @side_articles = Article.where("display = ? AND date <= ?", true, Date.today).order("date DESC").limit(2)
    @testimonials = Testimonial.where(:display => true).order("rand()").limit(1)
    
    @booking = Booking.new
  end

  # POST /bookings
  def create
    static_page = Willow::StaticPage.find_by_name("Book Now")
    
    @side_articles = Article.where("display = ? AND date <= ?", true, Date.today).order("date DESC").limit(2)
    @testimonials = Testimonial.where(:display => true).order("rand()").limit(1)
    
    @booking = Booking.new(params[:booking])
    
    if @booking.save
      BookingMailer.new(@booking).deliver
      redirect_to thank_you_bookings_path
    else
      render action: "new", :alert => "Please ensure all mandatory fields (marked with an asterisk) are completed"
    end
  end
end

