class SeoEntry < ActiveRecord::Base
  validate :rich_snippet

  validates :max_rating, :number_of_reviews, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, allow_blank: true
  validates :rating, numericality: { greater_than_or_equal_to: 0 }, inclusion: { in: [0.0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5 ]}, allow_blank: true

  def rich_snippet
    if item_reviewed.present? or rating.present? or max_rating.present? or number_of_reviews.present?
      if item_reviewed.blank?
        errors.add(:item_reviewed, "is necessary if any fields for rich snippets are set")
      end
      if rating.blank?
        errors.add(:rating, "is necessary if any fields for rich snippets are set")
      end
      if max_rating.blank?
        errors.add(:max_rating, "is necessary if any fields for rich snippets are set")
      end
      if number_of_reviews.blank?
        errors.add(:number_of_reviews, "is necessary if any fields for rich snippets are set")
      end
      if rating.present? and max_rating.present?
        if rating > max_rating
          errors.add(:rating, "can't be more than max rating")
          errors.add(:max_rating, "can't be less than rating")
        end
      end
    end
  end

  def valid_rich_snippet?
    if item_reviewed.present? and rating.present? and max_rating.present? and number_of_reviews.present?
      true
    else
      false
    end
  end
end
