class Banner < ActiveRecord::Base

  mount_uploader :image, BannerUploader

  validates :title, :presence => true
end
