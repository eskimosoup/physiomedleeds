class PageImageUploader < Chronicler::ImageUploader

  version :show do
    process :resize_to_fit => [200, 1000]
  end

end
