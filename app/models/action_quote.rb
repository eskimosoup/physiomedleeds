class ActionQuote < ActiveRecord::Base
  validate :content, presence: true
  #attr_accessible :content, :display
end
