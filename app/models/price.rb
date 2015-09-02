class Price < ActiveRecord::Base
  mount_uploader :image, PriceImageUploader
  validates :title, :content, :price, :presence => true
  #attr_accessible :content, :image, :price, :title
end
