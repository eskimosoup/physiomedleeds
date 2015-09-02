class Treatment < ActiveRecord::Base
  #attr_accessible :content, :display, :name, :summary
  mount_uploader :image, TreatmentImageUploader
  
  validates :name, :content, :summary, :presence => true
end
