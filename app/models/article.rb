class Article < ActiveRecord::Base

  mount_uploader :image, StandardImageUploader

  extend FriendlyId
  friendly_id :title, :use => [:slugged, :history]

  validates :title, :content, :summary, :date, :presence => true

end
