class Contact
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend  ActiveModel::Naming

  attr_accessor :name, :contact_number, :email, :message

  validates :name,  :contact_number, :message, :presence => true
  validates :email, :email => true, :unless => lambda { |c| c.email.blank? }

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end
end