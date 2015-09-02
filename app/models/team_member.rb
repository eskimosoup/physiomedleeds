class TeamMember < ActiveRecord::Base
  mount_uploader :image, TeamMemberImageUploader
  validates :name, :qualification, :role, :bio, :presence => true
  #attr_accessible :bio, :display, :image, :name, :position, :role, :title
end
