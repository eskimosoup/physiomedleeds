class Article < ActiveRecord::Base

  mount_uploader :image, StandardImageUploader
  has_one :tracking_code, :dependent => :destroy, :as => :trackable

  accepts_nested_attributes_for :tracking_code, :update_only => true

  after_initialize do
    build_tracking_code if tracking_code.nil?
  end

  extend FriendlyId
  friendly_id :title, :use => [:slugged, :history]

  validates :title, :content, :summary, :date, :presence => true

end
