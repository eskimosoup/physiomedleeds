class ContactsController < ApplicationController

  def new
    static_page = Willow::StaticPage.find_by_name("Contact Us")
    unless static_page.blank? or static_page.branch.blank?
      @current_branch = static_page.branch
    end
    @contact = Contact.new

    render :layout => "contacts"
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.valid?
      ContactMailer.new(@contact).deliver
      redirect_to thank_you_contacts_path
    else
      render :action => "new", :alert => "Please ensure all mandatory fields (marked with an asterisk) are completed"
    end
  end

  def thank_you
    render :layout => "application"
  end

end
