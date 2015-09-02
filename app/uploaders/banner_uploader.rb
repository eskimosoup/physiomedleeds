class BannerUploader < Chronicler::ImageUploader

  version :show do
    process :resize_to_fill => [558, 429]
  end
end