class BodyPartSection < ActiveRecord::Base

  belongs_to :body_part

  extend FriendlyId
  friendly_id :name, :use => [:slugged, :history]

  validates :content, :name, :presence => true

end
