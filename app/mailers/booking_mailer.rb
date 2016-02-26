class BookingMailer < ActionMailer::Base

  default :from => SITE_SETTINGS["Booking Request Email"]
  default :to => SITE_SETTINGS["Booking Request Email"]

  def new(booking)
    @booking = booking
    mail :to => SITE_SETTINGS["Booking Request Email"], :bcc => SITE_SETTINGS["Booking Email CC"], :cc => @booking.email, :subject => "Physio Med Treatment Booking Request"
  end

end
