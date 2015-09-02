class Booking < ActiveRecord::Base
  belongs_to :treatment
  validates :name,  :email, :message, :clinic, :treatment, :date, :time, :presence => true
  validates :email, :email => true, :unless => lambda { |c| c.email.blank? }
  #attr_accessible :clinic, :contact_number, :date, :email, :message, :name, :time
end
