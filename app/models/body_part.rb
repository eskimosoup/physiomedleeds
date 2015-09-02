class BodyPart < ActiveRecord::Base

  mount_uploader :image, BodyPartImageUploader

  has_many :body_part_sections, :dependent => :destroy

  extend FriendlyId
  friendly_id :name, :use => [:slugged, :history]

  validates :name, :presence => true
end
