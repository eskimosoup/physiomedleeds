class Page < ActiveRecord::Base

  validates :title, :presence => true
  has_one :tracking_code, :dependent => :destroy, :as => :trackable

  accepts_nested_attributes_for :tracking_code, :update_only => true

  after_initialize do
    build_tracking_code if tracking_code.nil?
  end

  extend FriendlyId
  friendly_id :name, :use => [:slugged, :history]

  is_a_leaf

  mount_uploader :image, PageImageUploader

  def name
    title
  end

  def route
    "{:controller => '/pages', :action => 'show', :id => '#{self.slug}'}"
  end

  def self.layouts
    %w{ application }
  end

  def self.styles
    %w{ basic treatments find_us prices }
  end

end
