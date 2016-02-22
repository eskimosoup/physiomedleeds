class StaticBanner
  attr_reader :image_filename, :title, :alt
  def initialize(attributes = {})
    @image_filename = attributes[:image_filename]
    @title = attributes.fetch(:title, "Physiomed")
    @alt = attributes.fetch(:alt, "Physiomed")
  end

  def image_url
    "static_banners/#{ image_filename }"
  end

  def to_partial_path
    "static_banners/static_banner"
  end

  def self.build_static_banners
    banners = []
    banners << StaticBanner.new(image_filename: "mothers_day_banner.jpg",
      title: "Mother's Day", alt: "Mother's Day") if StaticBanner.show_mothers_day_banner?
    banners
  end

  def self.show_mothers_day_banner?
    Date.today < Date.new(2016, 3, 6)
  end
end
